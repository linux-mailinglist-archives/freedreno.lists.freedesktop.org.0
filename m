Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0598D7D6B83
	for <lists+freedreno@lfdr.de>; Wed, 25 Oct 2023 14:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53B410E3D3;
	Wed, 25 Oct 2023 12:29:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2294B10E3D3
 for <freedreno@lists.freedesktop.org>; Wed, 25 Oct 2023 12:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1698236983; x=1698496183;
 bh=b7f1p7v4IPk9TLdlMpg0hUuSOsaHLDgWkqrooNiV9wk=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=jy59f/ZkCee2bLGRnHVg6g6CX68UCj9a8NVwVI0ICMdirIhvdFlP5+eNjfu9SV0su
 /oJHO6ZSqNeHqeyRX0I2/Fzw5z3IXNThqhemaOC0myO8kXuzMpWXQcSo2FcALYDvUV
 FEr8SrmnqJS5SfVDy5puJ09yAoAtr8vV1GK5zE7oyKn3znZUtWpGm7nAYPwyDOtFg4
 wPXCXMFrgCuduplg6dftl8UMmjz+e/q6s8jaoBdbuU2Bk5iBUv2tu0EzoN3Vr7A3jc
 BBupHU1taO1hpNfPMYepInDRSct3pGAYCCduE8+Y7lc3GaULLNU8nQUUzeLqBIH1au
 +SoQd80BMNASw==
Date: Wed, 25 Oct 2023 12:29:26 +0000
To: Johan Hovold <johan@kernel.org>
From: Simon Ser <contact@emersion.fr>
Message-ID: <NDl6Ye92jJDp3fm20AwcuUKWuP8tzQ9CyWGGRltZ_DxYgxep2DO8Wil0Nmsfmhp1j4vAp9Yu1duiHeQkjBG-bcAdFoW3ZbWxvVqrCEpQe_4=@emersion.fr>
In-Reply-To: <ZTkIpMWpxKzSE7gQ@hovoldconsulting.com>
References: <20231010225229.77027-1-dmitry.baryshkov@linaro.org>
 <ZTkIpMWpxKzSE7gQ@hovoldconsulting.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH] soc: qcom: pmic_glink: fix connector type
 to be DisplayPort
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Andy Gross <agross@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wednesday, October 25th, 2023 at 14:22, Johan Hovold <johan@kernel.org> =
wrote:

> I was just going to post a patch fixing this after finally investigating
> why the DisplayPort outputs on the X13s were annoyingly identified as
> "Unknown20-1" and "Unknown20-2" instead of the expected "DP-1" and
> "DP-2".

Note, ideally userspace should use drmModeGetConnectorTypeName() from
libdrm to figure out the proper name for a connector type. That way we
only need to update a single spot when adding a new connector type,
instead of patching a whole bunch of programs.
