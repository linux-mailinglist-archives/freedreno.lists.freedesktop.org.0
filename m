Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A24EE5031D7
	for <lists+freedreno@lfdr.de>; Sat, 16 Apr 2022 01:14:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A4B10E4B8;
	Fri, 15 Apr 2022 23:14:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 89275 seconds by postgrey-1.36 at gabe;
 Fri, 15 Apr 2022 23:14:46 UTC
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B012A10E518
 for <freedreno@lists.freedesktop.org>; Fri, 15 Apr 2022 23:14:46 +0000 (UTC)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl
 [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id E1F7B3F78D;
 Sat, 16 Apr 2022 01:14:42 +0200 (CEST)
Date: Sat, 16 Apr 2022 01:14:41 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Message-ID: <20220415231441.dd2cyrl7sfz5fvy3@SoMainline.org>
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
 <1644009445-17320-7-git-send-email-quic_abhinavk@quicinc.com>
 <20220414222642.f7wy3wdbsgmrqrxj@SoMainline.org>
 <1af827f1-b9b5-ed43-7bd8-8af6206eabaa@quicinc.com>
 <227cb6b8-c4c5-aa24-a91e-ccbd29260b29@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <227cb6b8-c4c5-aa24-a91e-ccbd29260b29@quicinc.com>
Subject: Re: [Freedreno] [PATCH 06/12] drm/msm/dpu: make changes to
 dpu_encoder to support virtual encoder
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
Cc: markyacoub@chromium.org, quic_jesszhan@quicinc.com,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 nganji@codeaurora.org, Martin Botka <martin.botka@somainline.org>,
 daniel@ffwll.ch,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 dmitry.baryshkov@linaro.org, seanpaul@chromium.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Abhinav,

On 2022-04-15 12:25:55, Abhinav Kumar wrote:
> Hi Marijn
> 
> Looking at msm-next tip, this code has already been refactored in
> 
> https://gitlab.freedesktop.org/drm/msm/-/commit/ef58e0ad34365e2c8274b74e6e745b8c180ff0d3
> 
> So, I will just rebase my changes on msm-next tip and it should address 
> below comments as well.

That's actually great, I love patches that remove a whole lot of
(especially bug-containing) lines, awesome Dmitry!

Looking forward to the next revision, spotted some minor nits in this
revision but it probably makes little sense to point them out here
presuming they might have already been addressed on your end or removed
altogether.

- Marijn
