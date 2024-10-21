Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8AD9A67D7
	for <lists+freedreno@lfdr.de>; Mon, 21 Oct 2024 14:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC9E10E4BB;
	Mon, 21 Oct 2024 12:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dQSeDfJU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB9B10E4B5
 for <freedreno@lists.freedesktop.org>; Mon, 21 Oct 2024 12:17:54 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2f75c56f16aso41602541fa.0
 for <freedreno@lists.freedesktop.org>; Mon, 21 Oct 2024 05:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729513072; x=1730117872; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jTNe+XnRvU9RR5VCLLOhfvM31yZ0+TUCEsnqZ6GIS1w=;
 b=dQSeDfJUIbXA950Yb4Nv3B2Pkm1ooXY2AFzBuXdxoDD84D8+KyYYtHAuBqjsyvK8/q
 GSvtnobEzujSEMpdoyUyLogOfkTlq0ulSGiBWbkQdxXo43Gw4jAAEPYRLZOhitwfcGgu
 Hw++Kg3vWfo2hBcb8PjEFv4HwJ5xXXvOsgszUX6PfAEG3/AZnV8M1dD/mf/XTTBaYFZZ
 ei46rx8XzkX7OqpyQ+mQURrL0CQZcI1ol0pmYQCUU90nrBReKlWBQ6jQsndxMAynd5uc
 oU3h1vtRK9BCm4RIQclI50ki1QmV7aV1wfCgwyRA4uQVdLwzNtSg4S9mmgdnpqXGfa/x
 6AtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729513072; x=1730117872;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jTNe+XnRvU9RR5VCLLOhfvM31yZ0+TUCEsnqZ6GIS1w=;
 b=W1TBCLVAbMaeUXqs/amgdCTJUmU2PiK0rNQ8Hg3HZ6N0tPAu1T7ePSy1ZqM61OEoHA
 Txi39FAlBEgh7x90VURXkLZbRK8P7PhA8i+K8LYdgLM5ud5LAzyFL3em/cKNA3JhgMln
 lj/EGWp7BAPFvz7UIdVpYleKmr6DpAAnRDQQaFCJGO0ijjHNvULKGKnWRWDUaedeM/W/
 mD1jSKPHquCOI2/cJuiEfHc8aI/LLnzoT2htCF/Oo9K+2yuX1XH7YJ8/UGNimrT2p8m4
 oJZsPGEW76H43Ai+/Vrf/GZc9lzUInhJ3LNaa05PJkC+nHUk3NOyl/wJTbtAJzFLzh9m
 7rsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXR7snKS48f0qt/RKV1cy5K4VyM57WiWlECCikTJkFyO3cHT8lS8vmNRuy+n+laPQV/mdr4mBG6GaY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaI+hMbhdBbBq/RO+/8aLEe1TwBG2j1NJpnA4PcLKtCrej52kJ
 bQG28uKCZhsZNfN2BB2UWvIVVxcjqxE62LZHdMOFNdKhbo9/sq7ftyJ75XxBYGaqVY47I53+4Ni
 7UM0=
X-Google-Smtp-Source: AGHT+IGHZwUBrGOlbOuGK6qQAG7Djezp3PB2cObNy0RjKNlSnT2HrV0co8D0CLg5sUkYjuoFUJOwNg==
X-Received: by 2002:a05:6512:3096:b0:539:f7de:df84 with SMTP id
 2adb3069b0e04-53a154412e2mr5181215e87.10.1729513072223; 
 Mon, 21 Oct 2024 05:17:52 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a22431454sm464210e87.212.2024.10.21.05.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 05:17:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>, Mahadevan <quic_mahap@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kalyan Thota <quic_kalyant@quicinc.com>,
 Jayaprakash Madisetty <quic_jmadiset@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 0/5] Display enablement changes for Qualcomm SA8775P
 platform
Date: Mon, 21 Oct 2024 15:17:41 +0300
Message-Id: <172950935859.2053501.16314780424128815600.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241019-patchv3_1-v5-0-d2fb72c9a845@quicinc.com>
References: <20241019-patchv3_1-v5-0-d2fb72c9a845@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Sat, 19 Oct 2024 21:14:52 +0530, Mahadevan wrote:
> This series introduces support to enable the Mobile Display Subsystem (MDSS)
> and Display Processing Unit (DPU) for the Qualcomm SA8775P target. It
> includes the addition of the hardware catalog, compatible string,
> relevant device tree changes, and their YAML bindings.
> 

Applied, thanks!

[1/5] dt-bindings: display/msm: Document MDSS on SA8775P
      https://gitlab.freedesktop.org/lumag/msm/-/commit/409685915f00
[2/5] dt-bindings: display/msm: Document the DPU for SA8775P
      https://gitlab.freedesktop.org/lumag/msm/-/commit/546f8d6c3ed1
[3/5] drm/msm: mdss: Add SA8775P support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4d1cd4c3faec
[4/5] drm/msm/dpu: Add SA8775P support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b139c80d181c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
