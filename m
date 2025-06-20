Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4837AE21DA
	for <lists+freedreno@lfdr.de>; Fri, 20 Jun 2025 20:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6ADA10EBB8;
	Fri, 20 Jun 2025 18:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nbbZblG7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A5B10EBB0
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 18:14:08 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KHcMgE025394
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 18:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9LhI2Xwe2pXBEvWnMtQOowUyXjOfB/3ScM2SDxNRahE=; b=nbbZblG7kIq7wyu3
 xw+eI9ITeOlHnddSN3xlHIuqi1GvqX9jIW2+o+5cVs3J6MAJTTzQSCP3spNtDM+s
 8mTI3L9kwB0HooUQ/wXwH6f/OgbGjOzmYbfhUw0Nq9YZK/uRV73+OpIHbj6OEgNK
 lyDG4rwz3I3HOEWBOyZYx+GsL/EwsJZZZLSp0SVuUOKDEAEypOZLVVooLySrRSDN
 /Jj4++tOh/OpKZ5CYGxosN3RTyxVURar7wyjs/t33Z9FZosk2MQvZZvejzlqIkXH
 gnxL705oMEaf3muEC16bjRqupwVtCS2waPuh6B6DUQMZd7a17XmHX7tUBajyS/cr
 8/dYfQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dc72r27k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 18:14:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d3dcac892bso318983385a.1
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 11:14:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750443246; x=1751048046;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9LhI2Xwe2pXBEvWnMtQOowUyXjOfB/3ScM2SDxNRahE=;
 b=Hty73tpCLKAv9DhlIXSyxOaxhDPmRppdgfH+OKajyz6sBxAhZ4EAksICvdMUbmBiGT
 B95/GOoYeTSAqkw7GCf4C19ty9Nfj5AsiVMNQMl9Wkvyg0N2XYNBcvGT951xu9sro4xb
 6IH/z4L2bkUNDlbWeKnCu92ldvgwQVqrhalC1SQ/l6SiFAT68g8CK2GzeO9br/lmc92p
 arddnAJEOudYBNLccMA5sZ2SrX/vVy2MfIscfTrn5rDdTmOpH28iL/gf/i1NRCgnRhy5
 RffRenXxKk2VRKznMK7Gb/+eGDHIk3e7QJsAJP7UumKON47i8gozjrZyNNlLy31NPosI
 d39w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYlnLrv385r04Oaz4TmySRIZHB7wAUerK+RD3FqpbIhKU23lFmnXdytNBJRivbZrLbdn3lME0R2C8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzu1K98KVW+8f/+HzCQn/62ZDy0mfMKsdVn6NU1V9dUt0AY/YyL
 D2OqIMWUN1APC5Mzr0IYFe1cmY4YOXd06HDLKsEZWq8C54OxxcZ8HS/QZioifRj7vHcWuC4l4qd
 jCnCQux7PuoNwMnFEtVNSqBp9llyRFBxbKqYcIlL+xslozLWue96tLn4bdkpacsGfeDlBeaM=
X-Gm-Gg: ASbGnctsMm3TNu1ZGoADhxNqGmNW01U+86aoRse0N1gdSupscA3aCfF4vn8Y+xCQI3b
 6dnGYg+rxTwPY0BGolBRa3vjYrjEcuHwCanZulMr0PfwsPfy7zRsyQ7bBJ0ENgjPVDJS+JSNMG9
 SIIKKWo25hcudDq03Fh7ZwPgXXMl771kECpZkC9xS6LYX+GM10HY5rnDTYiQxK92V6wPaSuu21X
 xbg+x1rJhR3ZI+ee5zIGQp1l1EE59s2namNLZ+lM2N6RnDZEWozo5z71cHOfjVGBYxpix/P/ktY
 wkNcMre2uSH3vujf5lZ6Rhnx+vPFl8uDF/p9FAAi0dYNMc2FI6GgfKR3dYMZQ0pOYVXj80sYiC7
 VjTjY8zBRRUsnJP3J6H6BY91oV+n1xyg4S/0=
X-Received: by 2002:a05:620a:4115:b0:7d0:9a17:7b93 with SMTP id
 af79cd13be357-7d3fc06d5f4mr385718485a.25.1750443246557; 
 Fri, 20 Jun 2025 11:14:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGF8a5iG3F+DfIN05T64ynCvLmjJR9evM/gfCnKmC2l0p9LUB+rWiOYDNmodaY5O6qyN66eA==
X-Received: by 2002:a05:620a:4115:b0:7d0:9a17:7b93 with SMTP id
 af79cd13be357-7d3fc06d5f4mr385713285a.25.1750443245901; 
 Fri, 20 Jun 2025 11:14:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553e4144306sm363384e87.18.2025.06.20.11.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 11:14:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>, Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v7 00/13] drm/msm: Add support for SM8750
Date: Fri, 20 Jun 2025 21:13:54 +0300
Message-Id: <175044313808.2014621.17398212116401078001.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
References: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GNgIEvNK c=1 sm=1 tr=0 ts=6855a4ef cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=e5mUnYsNAAAA:8 a=edIzf9TL5m76aqoGtVoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 1mZfsqvmeiptm0x8qhLwJJcoPr0CYyQd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEyNyBTYWx0ZWRfX06uAbSTOsgEQ
 jrfd15FfTA+24haeMNzAhJt10U13FBBUWyOeQBgi7c9B2RrxVjvkBJnSGY0s9CQyOCJHBZPr6OU
 WL3WnCSU2Y6T5/xnIPPqRpt5SOl6fYsEQRvD0KHwEq/42AAXuw8BEolKp/KB5rLaDDuYcFZWvmv
 eZREBdwxDbcTFxAHPAJfk/DGzNnUY0aJNfcXLcSfIyw4ICZ1ZyLt5MpUbtLAsoSVM61zxTWdFH+
 Pzf+ZJA+UcVw6XLBlWaD2KWdPhCymbD/mMN8aji7RGsOdmDGEq+z/0gJqbn54U7kPVZVveS4i3w
 hbeo7LMONrLI+OK0idZwM8iMWLFI0GpQKH9cD32FJlP1geHdU4YPshdAc03MgHNgqudHSWLBTIL
 zH+aCgQxPo94JJ2cIAYBbymRGA5zB8fisVspkxWf5CWjM0Ew2xbbVl4Hlew4v4ETUc/4IFah
X-Proofpoint-GUID: 1mZfsqvmeiptm0x8qhLwJJcoPr0CYyQd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200127
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


On Wed, 18 Jun 2025 16:32:29 +0200, Krzysztof Kozlowski wrote:
> Dependency / Rabased on top of
> ==============================
> https://lore.kernel.org/r/20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com/
> 
> Changes in v7:
> =============
> - Add ack/rb tags
> - Drop unrelated DSI enablement as requested by Dmitry:
>   https://lore.kernel.org/all/fa8d4af9-e822-4dec-a8dc-f3bbf5dd0100@oss.qualcomm.com/
>   These will be sent in separate patchset.
>   Such split allows to have SM8750 patchset fully reviewed, without
>   continuous requests of doing some more fixes in DSI PHY drivers
>   (related and unrelated like 10nm).
> - Link to v6: https://lore.kernel.org/r/20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org
> 
> [...]

Applied, thanks!

[01/13] dt-bindings: display/msm: dsi-phy-7nm: Add SM8750
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f8976415b669
[02/13] dt-bindings: display/msm: dsi-controller-main: Add SM8750
        https://gitlab.freedesktop.org/lumag/msm/-/commit/65e6647eda4f
[03/13] dt-bindings: display/msm: dp-controller: Add SM8750
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0122acd798ba
[04/13] dt-bindings: display/msm: qcom,sm8650-dpu: Add SM8750
        https://gitlab.freedesktop.org/lumag/msm/-/commit/12c9c014f83b
[05/13] dt-bindings: display/msm: qcom,sm8750-mdss: Add SM8750
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ea982597d19e
[06/13] drm/msm/dsi/phy: Add support for SM8750
        https://gitlab.freedesktop.org/lumag/msm/-/commit/714495a41634
[07/13] drm/msm/dsi: Add support for SM8750
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f4b6ecb62b7f
[08/13] drm/msm/dpu: Add support for SM8750
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9eff92a3ed18
[09/13] drm/msm/dpu: Consistently use u32 instead of uint32_t
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f409019fb4e7
[10/13] drm/msm/dpu: Implement 10-bit color alpha for v12.0 DPU
        https://gitlab.freedesktop.org/lumag/msm/-/commit/dd968c6e3e85
[11/13] drm/msm/dpu: Implement CTL_PIPE_ACTIVE for v12.0 DPU
        https://gitlab.freedesktop.org/lumag/msm/-/commit/82f64dae7f0d
[12/13] drm/msm/dpu: Implement LM crossbar for v12.0 DPU
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d96d8ba9a96b
[13/13] drm/msm/mdss: Add support for SM8750
        https://gitlab.freedesktop.org/lumag/msm/-/commit/0b385dc8d1b2

Best regards,
-- 
With best wishes
Dmitry

