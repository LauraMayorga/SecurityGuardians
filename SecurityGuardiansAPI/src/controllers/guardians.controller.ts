import { Request, Response } from "express";
import { security_guardians, PrismaClient } from "@prisma/client";

const guardianClient = new PrismaClient().security_guardians;

export const getAllGuardians = async (
    req: Request,
    res: Response
): Promise<void> => {
    try {
        const allGuardians: security_guardians[] = await guardianClient.findMany({
            select: {
                guardian_name: true,
                application_owners: {
                    select: {
                        owner_name: true,
                        iniciativas: {
                            select: {
                                iniciativas_name: true,
                                repositorios: {
                                    select: {
                                        repositorios_name: true,
                                        prioridad: true,
                                        backlog: {
                                            select: {
                                                backlog_name: true,
                                                info_extra: true,
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        });

        res.status(200).json({ data: allGuardians });
    } catch (error) {
        console.log(error);
    }
};

export const getGuardianByName = async (
    req: Request,
    res: Response
): Promise<void> => {
    console.log(req.params);
    try {
        const guardianName = req.params.name;
        const guardian = await guardianClient.findUnique({
            where: { guardian_name: guardianName }, select: {
                guardian_name: true,
                application_owners: {
                    select: {
                        owner_name: true,
                        iniciativas: {
                            select: {
                                iniciativas_name: true,
                                repositorios: {
                                    select: {
                                        repositorios_name: true,
                                        prioridad: true,
                                        backlog: {
                                            select: {
                                                backlog_name: true,
                                                info_extra: true,
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        });

        res.status(200).json({ data: guardian });
    } catch (error) {
        console.log(error);
    }
};