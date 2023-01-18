Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECF7671094
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 03:06:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD3C10E635;
	Wed, 18 Jan 2023 02:06:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835DC10E634
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 02:06:27 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id vm8so79802848ejc.2
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 18:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mHSfA1oXDaE/FU4E9HR36vol4vPeD8Mhirv4zCQzcxc=;
 b=OPk9ugaZdL99dXsw8gAtQuCpXq+2Sp7VbOcevQECf2grzH2Y4bJUZWuvovb2ITH1HD
 RuXQ9kI5r2N+sZZCwmJjjav46WA48btEh3yiqccF9jo9hn+ICkRg1D3uiTnWaAaNi+vE
 rur2Dh/MYNLvDZdRoB7NfvSRQBFDSY5KAnnjkMfYEoWYeTruwL/K93rBEBn4NMIo8Fht
 SpeiCYCJB5Pf/DCa7baJm8XGfar9GqReQBowPMYVBT0Ixb0iYGVFvGYAtb7Khrw2/gpb
 7BOfSfHPTYdlyDn7P8aLLPzl8vpDWrWLFvQDgWTvMpZyklAtwdqp9REnpG6+yBDEKRUE
 EZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mHSfA1oXDaE/FU4E9HR36vol4vPeD8Mhirv4zCQzcxc=;
 b=T0BOjcj+I1zebCQ9uCAOgTopVUbo2ZFbb4IoQFxl3RptaVpsLswN94jEOXq+s/43jO
 qt8Lr6bvn74U7vnwO1W8kzZ8Or/sbbqO08yCMmyiyyfcYa03j0REya0e0Ny7MZ/mmCdw
 U4gJSUiwxYUW+BkzfGOdx3zIy9OAxe6iRQzg6P3Yc9PxC4thocvKvmTxMTDQYAZO0hPQ
 g1YDsztVMRcaCq0mjS1DlK5JvqTk+BWZOHZCju2EhHrOJ3SWic6JclcFKKK9VXDct0He
 y4mTq5x4Ml7MMPgYuDECxdFzIZ5dt4D/NXSmwrNNnTHgLyl0RPu1v/fepV2aiUAXGpyl
 RZXg==
X-Gm-Message-State: AFqh2kq+eaB0CVNmJ11qarNb9tO2LhoqoLskI5xlhLhBPNxahakZO17a
 r4eKxr7UcAF0i/xPvdQOodGvLw==
X-Google-Smtp-Source: AMrXdXv6H0AyvXgNdKVOZT6ptngzqjVTe7RIPAWc/AruVWvl3CNh7mCChhz5F9Jl4JjaZra1OUYsxA==
X-Received: by 2002:a17:907:c712:b0:7ba:5085:869 with SMTP id
 ty18-20020a170907c71200b007ba50850869mr5622238ejc.9.1674007585894; 
 Tue, 17 Jan 2023 18:06:25 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 18:06:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 18 Jan 2023 04:06:08 +0200
Message-Id: <167400670534.1683873.14691625332379089234.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116063316.728496-1-dmitry.baryshkov@linaro.org>
References: <20230116063316.728496-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 1/3] drm/msm/dpu: fix blend setup for DMA4
 and DMA5 layers
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
Cc: freedreno@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Mon, 16 Jan 2023 08:33:14 +0200, Dmitry Baryshkov wrote:
> SM8550 uses new register to map SSPP_DMA4 and SSPP_DMA5 units to blend
> stages. Add proper support for this register to allow using these two
> planes for image processing.
> 
> 

Applied, thanks!

[1/3] drm/msm/dpu: fix blend setup for DMA4 and DMA5 layers
      https://gitlab.freedesktop.org/lumag/msm/-/commit/80ca10dc64ff
[2/3] drm/msm/dpu: simplify ctl_setup_blendstage calculation
      https://gitlab.freedesktop.org/lumag/msm/-/commit/644eddf9f166
[3/3] drm/msm/dpu: simplify blend configuration
      https://gitlab.freedesktop.org/lumag/msm/-/commit/63e3386b86d7

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
