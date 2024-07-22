Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A5893914E
	for <lists+freedreno@lfdr.de>; Mon, 22 Jul 2024 17:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42A310E15A;
	Mon, 22 Jul 2024 15:04:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ELBxKvDa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9885210E15A
 for <freedreno@lists.freedesktop.org>; Mon, 22 Jul 2024 15:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1721660685;
 bh=94V2FOBhQb+tZMxWV3mDiMf6SrdiLsoT8QBihrvghmc=;
 h=Subject:From:To:Date:From;
 b=ELBxKvDauC16KCXFH7IoeMNTmNatf3RGhsGmhEAgHjGojKbT+V6OlWuo1/xePcXBT
 1y2rSDxfibYoU3cpC+lRTy0pbIV7fXi7Rsc9oZBGY6QP+lStNGCckW91dqDMOHDzm0
 qt9oGOblx3E5TPLX3xBI4hrWTb2y5IJS7VBVpZPxmXDZ8blDmMf3o7teVCkj0tnPIU
 VWMMroKq4kchrDdJKrEmGW+dgYRF7sT1YMp0wg+eYHl15x5xa+WXYmy9IvzzlQOA4j
 LvXpNxKY/8JZdmqDEkV+f4/NlAVQU59/64w0GKlSsm1AVjRpcWhNijI3uOaq9DwvBM
 8VAGRbxCWZv9A==
Received: from [100.127.186.53] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: mfilion)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1A65F378001E
 for <freedreno@lists.freedesktop.org>; Mon, 22 Jul 2024 15:04:44 +0000 (UTC)
Message-ID: <776e5192c9a055ab3f5f2903fb04a8264bbc3302.camel@collabora.com>
Subject: Reminder - The Call for Proposals is open for XDC 2024!
From: Mark Filion <mark.filion@collabora.com>
To: freedreno@lists.freedesktop.org
Date: Mon, 22 Jul 2024 11:04:43 -0400
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40) 
MIME-Version: 1.0
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hello!

Reminder -=C2=A0The CfP is now open for talks, workshops=C2=A0and demos at =
XDC
2024. The deadline for submissions is Monday, 12 August 2024.

https://indico.freedesktop.org/event/6/abstracts/

While any serious proposal will be gratefully=C2=A0considered, topics of
interest to X.Org and freedesktop.org developers are encouraged. The
program focus is on new development, ongoing challenges and anything
else that will spark discussions among attendees in the hallway track.

We are open to talks across all layers of the graphics stack, from the
kernel to desktop environments / graphical applications and about how
to make things better for the developers who build them. Head to the
CfP page to learn more!
=C2=A0=C2=A0=C2=A0
As usual, the conference is free of charge and open to the general
public. If you plan on attending, please make sure to register as early
as possible!

And don't forget, you can follow us on Mastodon for all the latest
updates and to stay connected:

=C2=A0=C2=A0=C2=A0=C2=A0https://floss.social/@XOrgDevConf

Best,

Mark
