Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4106A6B9727
	for <lists+freedreno@lfdr.de>; Tue, 14 Mar 2023 15:04:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE4BE10E177;
	Tue, 14 Mar 2023 14:04:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B9010E177;
 Tue, 14 Mar 2023 14:04:21 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 2088920145;
 Tue, 14 Mar 2023 15:04:19 +0100 (CET)
Date: Tue, 14 Mar 2023 15:04:15 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Message-ID: <20230314140415.4aensrq6ntj3j25w@SoMainline.org>
References: <20230307-topic-dsi_qcm-v4-0-54b4898189cb@linaro.org>
 <20230307-topic-dsi_qcm-v4-7-54b4898189cb@linaro.org>
 <20230314130522.wimbrf7d6lqwdbgz@SoMainline.org>
 <441030fa-afcb-8e5f-ea5a-f467d9d11937@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <441030fa-afcb-8e5f-ea5a-f467d9d11937@linaro.org>
Subject: Re: [Freedreno] [PATCH v4 07/10] drm/msm/dsi: Remove custom DSI
 config handling
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
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Andy Gross <agross@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-03-14 14:44:06, Konrad Dybcio wrote:
> 
> 
> On 14.03.2023 14:05, Marijn Suijten wrote:
> > On 2023-03-14 13:13:45, Konrad Dybcio wrote:
> >> Now that the only user is handled by common code, remove the option to
> >> specify custom handlers through match data.
> >>
> >> This is effectively a revert of commit:
> >> 5ae15e76271 ("drm/msm/dsi: Allow to specify dsi config as pdata")
> >>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >> ---
> [...]
> >> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> >> index 8772a3631ac1..91bdaf50bb1a 100644
> >> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> >> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> >> @@ -65,8 +65,5 @@ struct msm_dsi_cfg_handler {
> >>  
> >>  const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor);
> >>  
> >> -/* Non autodetect configs */
> >> -extern const struct msm_dsi_cfg_handler qcm2290_dsi_cfg_handler;
> >> -
> > 
> > Probably the wrong `fixup!` commit: this should have been part of patch
> > 6 where the struct is removed, not patch 7 (this patch).
> Yeah, that's most likely what happened.. Does that warrant another resend?

For proper cleanliness it should have been... but maybe Dmitry can patch
this up while applying?  In that case, at least have my:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
