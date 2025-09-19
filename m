Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B37B8AEF0
	for <lists+freedreno@lfdr.de>; Fri, 19 Sep 2025 20:36:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 227D110E253;
	Fri, 19 Sep 2025 18:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cOTSP/1S";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 628A910E045
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 18:36:00 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JDwosu029580
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 18:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=hTmf9magk+DlWQu9tHn8bu4Z
 O0Ceo1+biZ46108Y4Yo=; b=cOTSP/1Si9D8QIE7AZqfda7fhE13dZtI1sZzIZFT
 zYGx41Ank5l8RvlgRoLsqWYTCbYrU3ZgYxixZS+G+qpL8MwRT/9hZEFEc30xNEo7
 Q2X4/XnGTfzqY+ajRCBlrf1/wN8EcUazYFJJBN9/FU+lUTsUX2VL81OqA3wAKcfb
 r4MYeljpxHsumH6XSPoZB0X6Zp86hU9T4+P8RHMwHG+nE67I7USju7p/BdWE89Oy
 JGuxTBlck+IhYwjo8ew7QJICsSmFG46x0BtVzpeqkEqwz/y87QUxDGcWU/r+1bVy
 hDizSpU/ePmsmeX4dHbh4MQEOQDcwqycD2hbIuWpsMexHw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy13f18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 18:35:59 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-726a649957dso42864626d6.1
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 11:35:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758306958; x=1758911758;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hTmf9magk+DlWQu9tHn8bu4ZO0Ceo1+biZ46108Y4Yo=;
 b=AXS8/L/B8mKrcSU8G9rkp1iMWxwuKN1ujBDpD/Il2a2wItPwT0Sc8GcOrL/w8AOJa2
 H0+nlMRHtWae1xXFKCESszZomJHhUkg8NXtJuwga0Fz+EfhwDwnpR2kOFJ/aKl5v/2ds
 fB93jC4PMYrKw7KGlzHeRtGp8waBOt8pqJ8wugjvdCIiej5o4F+iUHNcFYbv80IUE5lC
 S2oqVpMptcGbZPAINp8O1fqBYJZQ+z/wJol1OyFgyyN++WofNLYLXobc/NdsXUbayyzH
 kVGSG9OTj0fnFvDoGCwB1RUpAo6Uo9xlLL9RrWK6oUcXD6+KkS0vXTqlT9tXxXx6OK5w
 TbnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCQZPp3YtBA1142wooCVPHhAGNSCwyT0Eea3cN1876kEjklWqNGRGpNFFAg4/7CUswXpc6MnLbG2I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx65NKl3P8zu/FP5CwYToh6/yzCkMcRo4Ual53byuOf6Fq+0pQl
 6XyfZwXH2JQ1Sc0BidfASaQEww6JBniCQ44OdBeJUxEtYj1AxZPcllbKqH7Lr5mJ5BK8hCMZ4oq
 tEHqI6A6lL5bwR0II8aSMTjGFLR8lVOeXLyoh2XSFTnGCMGInHup0Q+h3eFXarkXaRuotMfk=
X-Gm-Gg: ASbGnctyVkCnruz1K6NEpC2G+8x8K8IcWpWxURIvG0lI1NAQZyUYQRFwrNhsfkMK5UY
 P/u8nzYZx5rbLuGqDmIcwj4wQXFogn3Jg7m/80/XbWoR4dOkxOIlVNNwJof1xFcL2qlzyYXx/6B
 3IHkpZ5mQTBywbS86cV6NbNc8y89S0kvaOfUIveFcklSaPm5LUZGPVl7h+iBQpuSQYrByL0qt6o
 IRy4aZo/SN5mYa2mZpbVtqV1tm8/PyQ6Ji14h0SAo/zBVz4Z/UILpqW5FELMnFnEXW2m2pZb7bF
 hQFbVOGpg8VBwncJa9lKEYDPX8VGQyu8D55YaekaLfDDEgbA6lVOmYS5ndAtUjKfnVHnuBgPXR/
 HsutAwnGnkbF3VgTRPt3L0/caRtJ2Tng6ojHfX0wv45knqYxUH45D
X-Received: by 2002:a05:6214:e6a:b0:794:518e:b176 with SMTP id
 6a1803df08f44-799129826ddmr46888796d6.21.1758306958346; 
 Fri, 19 Sep 2025 11:35:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOqy99Klf3VfxARITMXbbN0KY4DghVg+miJJ/vqzrCYCaw3nxehJtISCH41+5KegCo/Yw3Jw==
X-Received: by 2002:a05:6214:e6a:b0:794:518e:b176 with SMTP id
 6a1803df08f44-799129826ddmr46888316d6.21.1758306957787; 
 Fri, 19 Sep 2025 11:35:57 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-57b3528c49dsm84989e87.134.2025.09.19.11.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 11:35:56 -0700 (PDT)
Date: Fri, 19 Sep 2025 21:35:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v5 14/14] drm/msm/dp: Add support for lane mapping
 configuration
Message-ID: <j7ooyi5vih6ofnjigdgj6uk3ycutugunpm5pu5zf55pu5ua6r2@agg73zakjicn>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-14-eae6681f4002@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-add-displayport-support-for-qcs615-platform-v5-14-eae6681f4002@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: _zC0MJfs9mZp8kXk8haoHiSlZ_xLkctC
X-Authority-Analysis: v=2.4 cv=btZMBFai c=1 sm=1 tr=0 ts=68cda28f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=QVMBky1v5tPz4CN-K1AA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: _zC0MJfs9mZp8kXk8haoHiSlZ_xLkctC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX0rKvFXkFWCJP
 w2sTnlV6nhZ2o1cP6U69z+x477q1/SQjJWyO43O/eNrl02Fi9o/P6ycMR7bRvxTjo1dzDDblblu
 i3a6v8iGm9UECRvLj1J7x4RVUnaGv5hBsm/rKTkbX/zlqA2E5G8Lbm2w3TU+eZ4fGY74/QGQk4W
 tRrHvi7AXRaWok15qT84Di59oBCq2H0f7XUemadcK9LFgr7pMJc6IfN7yf/SmpN9BUWY2HX5YMB
 pNpfws7enPy2twgHSq/oG0orgThq2MQDBn3/XQXu/7pH3eQZAbOVGn2RU3HEtXZqy83mKVXtbfP
 Ir0eQ2GOtk/U6y/gyCpWspovA4yebxYdPauCXm2cN5DEAtp90CQO6YsUFcWuob7LncZ8hN3N8Ph
 dvOl5N/e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
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

On Fri, Sep 19, 2025 at 10:24:31PM +0800, Xiangxu Yin wrote:
> QCS615 platform requires non-default logical-to-physical lane mapping due
> to its unique hardware routing. Unlike the standard mapping sequence
> <0 1 2 3>, QCS615 uses <3 2 0 1>, which necessitates explicit
> configuration via the data-lanes property in the device tree. This ensures
> correct signal routing between the DP controller and PHY.
> 
> For partial definitions, fill remaining lanes with unused physical lanes
> in ascending order.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 10 +++----
>  drivers/gpu/drm/msm/dp/dp_link.c | 60 ++++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_link.h |  1 +
>  3 files changed, 66 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index 2aeb3ecf76fab2ee6a9512b785ca5dceebfc3964..34a91e194a124ef5372f13352f7b3513aa88da2a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -1236,6 +1236,61 @@ static u32 msm_dp_link_link_frequencies(struct device_node *of_node)
>  	return frequency;
>  }
>  
> +/*
> + * Always populate msm_dp_link->lane_map with 4 lanes.
> + * - Use DTS "data-lanes" if present; otherwise fall back to default mapping.
> + * - For partial definitions, fill remaining entries with unused lanes in
> + *   ascending order.
> + */
> +static int msm_dp_link_lane_map(struct device *dev, struct msm_dp_link *msm_dp_link)
> +{
> +	struct device_node *of_node = dev->of_node;
> +	struct device_node *endpoint;
> +	int cnt = msm_dp_link->max_dp_lanes;
> +	u32 tmp[DP_MAX_NUM_DP_LANES];
> +	u32 map[DP_MAX_NUM_DP_LANES] = {0, 1, 2, 3}; /* default 1:1 mapping */
> +	bool used[DP_MAX_NUM_DP_LANES] = {false};
> +	int i, j = 0, ret = -EINVAL;
> +
> +	endpoint = of_graph_get_endpoint_by_regs(of_node, 1, -1);
> +	if (endpoint) {
> +		ret = of_property_read_u32_array(endpoint, "data-lanes", tmp, cnt);
> +		if (ret)
> +			dev_dbg(dev, "endpoint data-lanes read failed (ret=%d)\n", ret);
> +	}
> +
> +	if (ret) {
> +		ret = of_property_read_u32_array(of_node, "data-lanes", tmp, cnt);
> +		if (ret) {
> +			dev_info(dev, "data-lanes not defined, set to default\n");
> +			goto out;
> +		}
> +	}
> +
> +	for (i = 0; i < cnt; i++) {
> +		if (tmp[i] >= DP_MAX_NUM_DP_LANES) {
> +			dev_err(dev, "data-lanes[%d]=%u out of range\n", i, tmp[i]);
> +			return -EINVAL;
> +		}
> +		used[tmp[i]] = true;
> +		map[i] = tmp[i];
> +	}
> +
> +	/* Fill the remaining entries with unused physical lanes (ascending) */
> +	for (i = cnt; i < DP_MAX_NUM_DP_LANES && j < DP_MAX_NUM_DP_LANES; j++) {

Nit: i = cnt, j = 0; Don't init loop variables at the top of the
function.

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> +		if (!used[j])
> +			map[i++] = j;
> +	}
> +
> +out:
> +	if (endpoint)
> +		of_node_put(endpoint);
> +
> +	dev_dbg(dev, "data-lanes count %d <%d %d %d %d>\n", cnt, map[0], map[1], map[2], map[3]);
> +	memcpy(msm_dp_link->lane_map, map, sizeof(map));
> +	return 0;
> +}
> +
>  static int msm_dp_link_parse_dt(struct device *dev, struct msm_dp_link *msm_dp_link)
>  {
>  	struct device_node *of_node = dev->of_node;

-- 
With best wishes
Dmitry
