Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 037C9ABE5F3
	for <lists+freedreno@lfdr.de>; Tue, 20 May 2025 23:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7560E10E094;
	Tue, 20 May 2025 21:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PVO7/Jae";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949FB10E094
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 21:23:07 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGeEA7026994
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 21:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=PJTTKnBKjzIZMKSIryiRh8vV
 CPHt6pjQ+IbbYXOR+bs=; b=PVO7/Jaekzn6FyDP88eo2rAwY4jev+tP0JzYkC6i
 Nm1iVFwMn+ZBhdN+Wa/sBk6UarR8VW6LRQNQRR5bvzVJFruzrSaB+1o7wHMFR2YG
 UA+bfQYSbormVehAN6UZJQ593KF3me35XXm6ARsov4IgPgzOiISUK2AGDbPswb7t
 C6Q8Ksvwz6nfZHvagM1mssjXCV/G0hy0cOoNqXq6/pSCVn2ikDPLyqzExyc3hpTw
 2SYey1mfByN1hSJIMFNmUUcXi3UWrXUT//hiUlqzhp2iHj4Y+dqV3yvQeSpk0d23
 /7KenO/Hb2X6hDNRo8fdaBSBe+uex8YeZiKHudeUIG9Q4w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf98nqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 21:23:06 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f8d448a7f3so47811516d6.3
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 14:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747776185; x=1748380985;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PJTTKnBKjzIZMKSIryiRh8vVCPHt6pjQ+IbbYXOR+bs=;
 b=VEitI5kVKeZBcPIYwN3IvdJD0lLtTojgq0kkdgcXWr0Ml0Uu41+D7QHoKs0awJqQB4
 HufwQUeRcacq1qY2V7uEaOojj1uwchnCahDcK/+bHb/Q1pc1/kwOw0Q4SPWGQjVojAMo
 vjJbWw9C+Ln9WrPe0Z/rCA5JaY6c/EWAMPowT4V6cf0j0IKpiunMmyYHFGdIAeGJesGB
 3DUJ32eGtysjY49zrUZuZWN7kcGVyhbdShoHd3/8D8uY74ey7K7QTuAw1XzBth8+VsZF
 rEhKW8Au/lk6zAaO8HHNeMi8WJd1dNzYIUrb8xMi/eooN8KBEjrISkrO0yEri7fH78jg
 vobQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYkbayCNi7Bc0mXuk0UzzkOToOgLwzuyVPYE0TkwYoq6GpirAzyyYwifavCMlP9chf6DVH0HzmdRI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOC3F0sad41M2cU7ETesLb6juTderxucoCo3H8bu3VcioYUdiA
 n8Pw5oJkfn9GeWmELB+HwIxpdv7kssgj/5hSnt3g+ypr+eUFhvuAa9L39S12B2AB9hvLtrvqpZL
 3M7bNMbo0rCuEsJtwDvfiFVuPUmnHqZW0KCbuaynR7UXUZkeDuIQ4FdKQ81A6wvXlHlXyKBo=
X-Gm-Gg: ASbGncugPJJGTArkk1PNeQ/eSNVVH8fZE6nUBi/dJ6hK6CrVFDJzA42r/SI7rWci/7j
 5pWhNBexut/mLNdbQMmYHe7t9OqCaBbgu+v9/+46DgrtRamQtcGqpmH1Ru2kxONnZ/e1t/AgR2p
 XBassFSXnDMR8pGORvIsEPI4cpLSFbJFH7ZsDvYp9pQj913uzhfjFGcUlQ0P1SGci8kL7t5/hWS
 T2S6YdqTDqIerRASakgszpNyYMGiOyK5gddsBkWGDSw1SdRTZgCd3e1mTtPN6vPrJr2xsvYjzca
 Y2lJU1a4raNVyfe1z0FfoMWgk+TRvPOMpp4vtc5Gg3BqJ0V2g3QNStPKmZW/ZfIyl+62UhWtu9U
 =
X-Received: by 2002:a05:6214:1302:b0:6f8:ac7b:c1ab with SMTP id
 6a1803df08f44-6f8b08bfa84mr302151486d6.34.1747776185565; 
 Tue, 20 May 2025 14:23:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSNH/J3cdOwkKYoEGIk9Q5AXGp27fsWVQp+pVM4ZLDvbwZD5a2qcj2J/WGs8mI5wFvjVD1oA==
X-Received: by 2002:a05:6214:1302:b0:6f8:ac7b:c1ab with SMTP id
 6a1803df08f44-6f8b08bfa84mr302150946d6.34.1747776185076; 
 Tue, 20 May 2025 14:23:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328084cbbcasm25005051fa.46.2025.05.20.14.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 14:23:04 -0700 (PDT)
Date: Wed, 21 May 2025 00:23:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
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
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v5 15/24] drm/msm/dsi/phy: Define PHY_CMN_CTRL_0 bitfields
Message-ID: <f4ciopex6fo6u77shetfa3hjb3ehvy3brkocyjcbd6xchkmgxs@v6xfxhye24hg>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-15-8cab30c3e4df@linaro.org>
 <j47udhqq3ldsza3cr6a6rd5dq7uxjgpolbmdhmpzvzt7glpuva@v5tgkydlywag>
 <b4f68273-6c3d-4ca5-8b8d-8837f3f03683@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4f68273-6c3d-4ca5-8b8d-8837f3f03683@linaro.org>
X-Proofpoint-ORIG-GUID: 8ryQu40QNMd4egSKhXoZfo9ifs5OV9Pj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE3MyBTYWx0ZWRfXwv96dYbc5ywB
 qEGxLc/RGMczyH5ujWRm+6W2btsF3zvi86kE5oHZVNwVLaPxtdwEZck4xBjpOR3ifMitynx8BX4
 L+B7nh2L9CUbaqWxbLDBCprsR6dfPm3C431J+LZ5Y0tJdz6+BmRo5FAnF/VDjyvW31YK0pEOBvV
 +qaS2vumvOOAlMH+7gOjkOCfKftl9ZLpMYDbSZ1UAS/QWFLMAuBcSQsmVS42uDnpLFBmJdSaNFD
 DcBYWFfkA6q+uPNtj88A8ORgUiEm8Sw0IyqFsPVAi8BZBd4JVZPbssp97WZwgV1vpbI5VpUvgdC
 2XNH6T+QXAoRdtsKmThuo5nlHNd2eDqtC47D4+1fbn2s488BSxb46TIAze6MNGVgNabzkA6vCNx
 racpyk7/PjNDY5oOxqhnWC8g/XWFl7DsNj4NGlyfRS8i0ZVvvLDQIJoXf33mVZbYDilGtDGE
X-Authority-Analysis: v=2.4 cv=GawXnRXL c=1 sm=1 tr=0 ts=682cf2ba cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=SyEZ2-kNlmUJddv_52kA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 8ryQu40QNMd4egSKhXoZfo9ifs5OV9Pj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505200173
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

On Tue, May 20, 2025 at 12:57:25PM +0200, Krzysztof Kozlowski wrote:
> On 03/05/2025 00:44, Dmitry Baryshkov wrote:
> > On Wed, Apr 30, 2025 at 03:00:45PM +0200, Krzysztof Kozlowski wrote:
> >> Add bitfields for PHY_CMN_CTRL_0 registers to avoid hard-coding bit
> >> masks and shifts and make the code a bit more readable.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> ---
> >>
> >> Changes in v5:
> >> 1. New patch
> >> ---
> >>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             |  9 ++++++---
> >>  drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml | 11 ++++++++++-
> >>  2 files changed, 16 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> index ca1a120f630a3650bf6d9f9d426cccea88c22e7f..7ef0aa7ff41b7d10d2630405c3d2f541957f19ea 100644
> >> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >> @@ -362,17 +362,19 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
> >>  static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
> >>  {
> >>  	u32 data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
> > 
> > This (and several following functions) should be triggering a warning
> > regarding empty line after variable declaration block.
> 
> Hey Dmitry,
> 
> I am implementing all the feedback and probably rebasing but to clarify
> this part:
> 
> There is no checkpatch --strict warning here exactly for the reason I
> was saying. For readability there should be no empty line after because
> such statements are expected to be together. I don't mind of course
> adding one, so I will implement the change.

I'd prefer this:

u32 data;

data = readl();
data &= foo;;

> 
> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry
