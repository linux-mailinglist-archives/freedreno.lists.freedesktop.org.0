Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 810E9AC826C
	for <lists+freedreno@lfdr.de>; Thu, 29 May 2025 21:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576F810E25B;
	Thu, 29 May 2025 19:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mark.filion@collabora.com header.b="Va2cTyG0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com
 [136.143.188.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B695410E778
 for <freedreno@lists.freedesktop.org>; Thu, 29 May 2025 19:02:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1748545323; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=hfwNybd0jNmybclQTJzPoYa8OEclG58CpVuK9dmBZ9g23fpo9yaVPh4xltJQnBoSdSakQaYkQRO0IK0JKWR/PuWg4LFWyEny253Vpol2l/HjdQfqeGj5mzBu/2h13ckx5pLe4TOTx+U4uLHJqbxg3m+XW25DhcTZar/jkoYH0Tg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1748545323;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=L3uj6rLy46QHqM66eogkjrelHkiVumz/LWjuCMD+K9U=; 
 b=Oc8FQIUOC7tnGSVTKEQ8wWskGkwN2AB1GqA/XwO03hYJP0ltV24gPgltqFWY5bt9goOMdBJeZz0OWWoe1qhpu5xjw2n9M7oNuNo4s4yuDYLZNFUvaHS633CE/a/fKs3LB9oWpbHJCzxc14cX0znmMIR+aoJ1OlSbTcfrDbv7M0s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mark.filion@collabora.com;
 dmarc=pass header.from=<mark.filion@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1748545323; 
 s=zohomail; d=collabora.com; i=mark.filion@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To:Cc;
 bh=L3uj6rLy46QHqM66eogkjrelHkiVumz/LWjuCMD+K9U=;
 b=Va2cTyG0QiTpuytLazhdUUqjLtbUoOmF6bYcKPpWesQ+Q9/LltAjpuhTreLw9MTQ
 OK3yV2u45Nt8gMulmFx49Ma2PsOsFyj1wkYuFECcbQuLd/6j/mKtO1isPYEENrVQy45
 ZEfM7nDrD6xFTCR9vnf732GB+NWow+xexcQ70nyA=
Received: by mx.zohomail.com with SMTPS id 174854532126885.5726946863357;
 Thu, 29 May 2025 12:02:01 -0700 (PDT)
Message-ID: <4b202e88a053d35c680a874f7a2a32102214887a.camel@collabora.com>
Subject: XDC 2025: Registration & Call for Proposals now open!
From: Mark Filion <mark.filion@collabora.com>
To: freedreno@lists.freedesktop.org
Date: Thu, 29 May 2025 15:02:00 -0400
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42app2) 
MIME-Version: 1.0
X-ZohoMailClient: External
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

Registration & Call for Proposals are now open for XDC 2025, which will
take place at the  TU Wien Kuppelsaal in Vienna, Austria on 29
September to 1 October.

    https://xdc2025.x.org
 =20
As usual, the conference is free of charge and open to the general
public. If you plan on attending, please make sure to register as early
as possible:

    https://indico.freedesktop.org/event/10/registrations/

In addition to registration, the CfP is now open for talks, demos, and
workshops at XDC 2025. While any serious proposal will be gratefully
considered, topics of interest to X.Org and freedesktop.org developers
are encouraged. The program focus is on new development, ongoing
challenges and anything else that will spark discussions among
attendees in the hallway track.

We are open to talks across all layers of the graphics stack, from the
kernel to desktop environments / graphical applications and about how
to make things better for the developers who build them. Head to the
CfP page to learn more:

    https://indico.freedesktop.org/event/10/abstracts/

The deadline for submissions Friday, 11 July 2025.

We are looking forward to seeing you in Vienna! If you have any
questions, please email the organizer (hfink at snap.com), adding on
CC the X.org board (board at foundation.x.org).

And don't forget, you can follow us on Mastodon for all the latest
updates and to stay connected:

    https://floss.social/@XOrgDevConf

Best,

Mark
