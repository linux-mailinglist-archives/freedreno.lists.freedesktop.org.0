Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4827C4C61
	for <lists+freedreno@lfdr.de>; Wed, 11 Oct 2023 09:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0F010E22B;
	Wed, 11 Oct 2023 07:51:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-4327.protonmail.ch (mail-4327.protonmail.ch [185.70.43.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 375CE10E22B
 for <freedreno@lists.freedesktop.org>; Wed, 11 Oct 2023 07:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1697010244; x=1697269444;
 bh=fhfaMyYupSidT8X2qeuG5+kniub3gKCqrstcySbQZYU=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=E3+TEcLoODu/hy/5rKQqKzVOGyshqn4KUFFQkQNpn2rjiJn0fOA8QifLRrB2PN4cT
 zZBZp4BDXTZ40f528qozszVFNG2Rp453THk/UD/U/hDKj/T4UJnGLoWY95XVFfTKpo
 Yjp4wTRqPSGrTPTPtIbOh2Bli7Z5CZbglc1jSihRiZox+Uit+hnnrBIpF0bCq8iX8o
 YQmQkRo6nqliHF4yzvUXGCVFn+431Nqi3nu8yjdRw0BIreH/rUFqExxm7vS4GXzcrX
 a85L897r+M8wHhcD/0RHxFOHFDdHKrxVoNU0vja2T5+w5b+XBydYxdubBUvPEYJaLH
 7UVr+keMas/lA==
Date: Wed, 11 Oct 2023 07:43:47 +0000
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
From: Simon Ser <contact@emersion.fr>
Message-ID: <HIG_NEF6icf1NPpaYFpV4-5TILrAGna4mq_L-6TeHSBqn2BNAnwHTNowxfak9S2lKKNCI9yGLi5FdDJaAZHlicLbS9gfTVxQoIbxJewpgq4=@emersion.fr>
In-Reply-To: <20231010225229.77027-1-dmitry.baryshkov@linaro.org>
References: <20231010225229.77027-1-dmitry.baryshkov@linaro.org>
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Thanks for fixing this!

Acked-by: Simon Ser <contact@emersion.fr>
