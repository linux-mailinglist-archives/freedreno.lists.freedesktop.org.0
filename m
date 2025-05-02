Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D52AA7C67
	for <lists+freedreno@lfdr.de>; Sat,  3 May 2025 00:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D1310E975;
	Fri,  2 May 2025 22:48:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eLsXxWq/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6DE10E970
 for <freedreno@lists.freedesktop.org>; Fri,  2 May 2025 22:48:20 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KArVc009084
 for <freedreno@lists.freedesktop.org>; Fri, 2 May 2025 22:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=eleFOyC3fOtiERUR0ch/uTI7
 FND8UmJHhoCAGFzcQJU=; b=eLsXxWq/CovyGDefzgsC83Ma03HfEVHyVuNYVy6L
 yPDK82DlulowW/tsmLvam7BTRo1DdnJxxGJB91LGYdzH6/7g1dqkus/cYjeO8Z/O
 lJxBwSqnAsGHA0KpQEoFAHpkGW7sRjbV5EgdqhP+eFy/wlzm+J9w7dBRCmesjILA
 4f6kgbAs29w8V5CTubgnQjpCSe2auxetfeV37XeSVRKWbi+rAwuYWI3H5iEMabzg
 g0UH/UTARw3Mtx/cyRd9DJBeiqLQjaR1qyb9+RC9IXb9cZbQt9xEOloowIgmAnhM
 V+m8TTAdE8OM8TjgYTwo5cBBJTu2Dh1FzumCo9+mK7fxiQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u21k2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 02 May 2025 22:48:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c955be751aso436221885a.2
 for <freedreno@lists.freedesktop.org>; Fri, 02 May 2025 15:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746226098; x=1746830898;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eleFOyC3fOtiERUR0ch/uTI7FND8UmJHhoCAGFzcQJU=;
 b=svhAWv+NpFZvHSbV/YvxoLIz5Q73SXc4nzrp+iZmXBhdKtZNEg3bT94/que3OkkpYV
 VQ2WK268JeX3H7w1xMpl53NWsBGkXGTTEeZ7C5lVQPHni84xE39DMN8g4xdwZQSejL2/
 /zoAKgIuuEoaQAWAjoCfHnY5j6jg3GQiWp6sAW5FLH0cd7MvqzEqlEfdz/5jSIMFPY1M
 l8vg3QfMRDOYhYby/fErI8koUpAD9tfAFjMHGb3uHTvpYodKVEo1O2bQT1w74ZuySV9D
 Y5z6NMdOArXMIcZXJawfpHjwH9/RWiAexD3d/julqhogbhqE4fBxMG4ZzXyp+75k3wbN
 zLCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWP8w/j7FnFaMXubrLXXfLhIGd2XlhxWFdq04P7CQmOKCQ1beaUx0uUFOQQGKVS9IXJjZGqH9YqbB8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywtviyz1SPNKjs6w8QjqIdAsdFE252czifg/5AD0a3jCeKN5XY/
 nD85hdi28IzaUPKTlSahDlp6LHCU1CjeiHxIEcMpvt7WpU5JMlLAElNlYXqi8LQs8FQX+W+6AGG
 sWhrXkXKeG7JgyYnhtv0o8OHJJpbhxR3YunvojgHVzU1KumyR3gbdTNBZJUv+0ub2V3M=
X-Gm-Gg: ASbGncucV0t4iSl3O4WfUdni58Ycvb+QZl8lUeVKRk9WrVk/+9BuP9vPXNg7JdcFLRP
 xck9OuyTEdz6xTPei97E3WzaMt1p4/QbcF3AfxjLADyuDNNyAhERm6iI2BUbV3xjmWoMZfB7Y61
 wr9QwPU3Z5LcGtbSGd7OaJ6eAHt0V6u/zDCzxg0rsFKG5h4K6GoJ+FxEk2r9LTOgZeMKHXKLABL
 gv0xV+kF5sT6cXGwAzeZVX6uyZFKE3lUWet066ng7YRhUXakMtBrdk7a99pXqXRpVD6zSQE5wRA
 ftjJHl38wU7TaHUCyaqVr/CWQSuJEgY1gnGS8etoNcPq9Nx1Tkjps4Jgx6w/n1/JgkZLhzkRAeI
 =
X-Received: by 2002:a05:620a:2903:b0:7c9:443e:7026 with SMTP id
 af79cd13be357-7cad5b2093dmr658530685a.8.1746226098376; 
 Fri, 02 May 2025 15:48:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxvVUCE28kLO4ASUoCbxheAfyetz9Jt5+OUgHDim+9B4loVIqn+DtUk4rE7DTKtJgIyo0Arw==
X-Received: by 2002:a05:620a:2903:b0:7c9:443e:7026 with SMTP id
 af79cd13be357-7cad5b2093dmr658527185a.8.1746226098052; 
 Fri, 02 May 2025 15:48:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94f69cfsm511823e87.227.2025.05.02.15.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 15:48:15 -0700 (PDT)
Date: Sat, 3 May 2025 01:48:14 +0300
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
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v5 17/24] drm/msm/dsi/phy: Fix missing initial VCO rate
Message-ID: <sz4kbwy5nwsebgf64ia7uq4ee7wbsa5uy3xmlqwcstsbntzcov@ew3dcyjdzmi2>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-17-8cab30c3e4df@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-b4-sm8750-display-v5-17-8cab30c3e4df@linaro.org>
X-Authority-Analysis: v=2.4 cv=G5AcE8k5 c=1 sm=1 tr=0 ts=68154bb3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3iPOKqzCR-5T2sWUWG0A:9
 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE4NyBTYWx0ZWRfX8GNyMmYfcDDH
 vDQHbCrnezYvF98Q9KNPWBhmuxVzjK91cl8GcNFhfPLMsc8DJbELn/iuIWygxvaHJfnd9JdhZuG
 c3AvSatOjMmkMCLQosUgz+zQmUz4t94RVTj1OsKT8maQPQUUm5sB1IT33gQBzCLUVaSaDEMrGb+
 4v/mVU4jiuMnfzS7cjarTJ6ImKz+03DiPwJLxEiKVxlFDjzZmNm1ROMfUbEgPWrIC3fluMrKF/i
 RQQon4SB0s+7wGNdXKRhYFtKI6ztJXE/bvbFtkvJNF08FmJgVmq5Ak/wYVAvl/Fnszeq/LKRBnL
 NVxYk4KhnUjslRu4w4Spq2v8nCgcF8lSgao36EDewOibos7alJR5dBvb8CeNSpD41Nv4S/tbs7H
 zALDk92vUua/NHVBRebuf71rHK/Srt1J68xQ9Wm48Evce/A8M1fWzquhLvqP/ouyw2aNaT4W
X-Proofpoint-GUID: 2dBV9LewZAT4GGd2JMg-w-8e6RCMgEzJ
X-Proofpoint-ORIG-GUID: 2dBV9LewZAT4GGd2JMg-w-8e6RCMgEzJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=668
 lowpriorityscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020187
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

On Wed, Apr 30, 2025 at 03:00:47PM +0200, Krzysztof Kozlowski wrote:
> Driver unconditionally saves current state on first init in
> dsi_pll_7nm_init(), but does not save the VCO rate, only some of the
> divider registers.  The state is then restored during probe/enable via
> msm_dsi_phy_enable() -> msm_dsi_phy_pll_restore_state() ->
> dsi_7nm_pll_restore_state().
> 
> Restoring calls dsi_pll_7nm_vco_set_rate() with
> pll_7nm->vco_current_rate=0, which basically overwrites existing rate of
> VCO and messes with clock hierarchy, by setting frequency to 0 to clock
> tree.  This makes anyway little sense - VCO rate was not saved, so
> should not be restored.
> 
> If PLL was not configured configure it to minimum rate to avoid glitches
> and configuring entire in clock hierarchy to 0 Hz.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v5:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Please implement similar change into the 10nm driver.

An alternative approach might be to do something like (14nm):

        cached_state->vco_rate = clk_hw_get_rate(phy->vco_hw);


-- 
With best wishes
Dmitry
