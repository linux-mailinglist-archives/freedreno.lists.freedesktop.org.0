Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3427276C9E5
	for <lists+freedreno@lfdr.de>; Wed,  2 Aug 2023 11:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A46A10E533;
	Wed,  2 Aug 2023 09:55:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F4C10E52D
 for <freedreno@lists.freedesktop.org>; Wed,  2 Aug 2023 09:55:50 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fe0e34f498so10620171e87.2
 for <freedreno@lists.freedesktop.org>; Wed, 02 Aug 2023 02:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690970148; x=1691574948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DKqLUXspaJON4xh0rFU75b5EtCdMDqUBZT8picxyMXU=;
 b=aso+9tEA3VJUMkHmFRFYRsiMMnijJrzDdFB0IaV0YaYpjAzKE3fv7+QgkRB8P8qZYq
 ghQuYTfa1Ihk60y+Bg006Hd1vtEi3TPp6eD/vRN5QfNIhfrLOVU4yjAgptJd7+aknJKU
 vf26JUPGCqnwdrAfkDJ4cL+sBUh0NYF1ubBM9Sn/Oruh/lEcRFYpkF6mbogsERzhTAik
 3Ke9uYl5pIJQ54M815XwWH98cbYZtK4gtiH7yaMogW7zKzylZKx0AGldKJU4gXUWqjz6
 wqBbPMj5LSH2412rMY4kAFkCQhXtO6b8RZHtU6X6MRQt9Qr9mcRodqPL8bRVOt2r+yx+
 bltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690970148; x=1691574948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DKqLUXspaJON4xh0rFU75b5EtCdMDqUBZT8picxyMXU=;
 b=L0CBSvvbVaJn4hIHWP99xnVCYEX9/lhTg1cIEIzyt9Nss9iMnKOw6y+39Rw/Rfloni
 31uN7R0rbFxF+hRc3r7kyu4+mKK9ToGPNeDp+9Q4J1+CiO0jN546hRb0D2lt6yduaYUf
 iGuESgK6/TIhMRac20nWPO0pniEwWd3L1mNPWdjEFypW/khJuXJdP0GbF1KpznySJRLD
 Ji8P+mHCenEBCih0PX8SwV64RYnQNQkuOu0dpvpBz6ZMTuGHkSJv1gRW2MQqtaC7YTsP
 BtO3NQ5ki+PXTipkqOoPlyjLgCubbdfocIhynetwakvWxYwsIGfh9RGzEw+sD/Umd7+P
 Jm2g==
X-Gm-Message-State: ABy/qLbC3LBK3EPrkD43JDLljAfu1asYQW6kh3+eWnmn4fWj+sBrQR5Y
 bXdgsyaU6pDrO/30NAiYlPDI5w==
X-Google-Smtp-Source: APBJJlFG9ALH+xv8nwX0EvALXqeSL+oi5vCr8dzLs5kzIf8xjNtT1F8uSets/iY+ApHWEwA1Ooy+lA==
X-Received: by 2002:a05:6512:214a:b0:4fe:1e69:c379 with SMTP id
 s10-20020a056512214a00b004fe1e69c379mr3786688lfr.13.1690970148296; 
 Wed, 02 Aug 2023 02:55:48 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x17-20020ac24891000000b004fe1960dd7csm2779762lfc.132.2023.08.02.02.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 02:55:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed,  2 Aug 2023 12:55:43 +0300
Message-Id: <169096995979.4183272.13972595763637805461.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230728213320.97309-1-dmitry.baryshkov@linaro.org>
References: <20230728213320.97309-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v2 0/7] drm/msm/dpu: use UBWC data from MDSS
 driver
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Sat, 29 Jul 2023 00:33:13 +0300, Dmitry Baryshkov wrote:
> Both DPU and MDSS programming requires knowledge of some of UBWC
> parameters. This results in duplication of UBWC data between MDSS and
> DPU drivers. To remove such duplication and make the driver more
> error-prone, export respective configuration from the MDSS driver and
> make DPU use it, instead of bundling a copy of such data.
> 
> Changes since v1:
>  - Rebased on top of msm-next-lumag
>  - Reworked commit message by patch #5, following the request by Abhinav
>  - Dropped DPU_HW_UBWC_VER_xx values
>  - Also removed DPU_MDP_*BWC* defines
> 
> [...]

Applied, thanks!

[1/7] drm/msm/mdss: correct UBWC programming for SM8550
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0fbe7c7d36e8
[2/7] drm/msm/mdss: rename ubwc_version to ubwc_enc_version
      https://gitlab.freedesktop.org/lumag/msm/-/commit/cab5b40633b0
[3/7] drm/msm/mdss: export UBWC data
      https://gitlab.freedesktop.org/lumag/msm/-/commit/71e00fc0afde
[4/7] drm/msm/mdss: populate missing data
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6f410b246209
[5/7] drm/msm/dpu: use MDSS data for programming SSPP
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a2e87e9ef891
[6/7] drm/msm/dpu: drop UBWC configuration
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1613c5fddd42
[7/7] drm/msm/dpu: drop BWC features from DPU_MDP_foo namespace
      https://gitlab.freedesktop.org/lumag/msm/-/commit/7b4a727e84f0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
