Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5FBB2DB5A
	for <lists+freedreno@lfdr.de>; Wed, 20 Aug 2025 13:42:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F3F10E705;
	Wed, 20 Aug 2025 11:42:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LBV4uVez";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC3B10E6FF
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 11:42:36 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KAE5ll029929
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 11:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=T7wGxRO/zr/otAECRnr8/RO0
 TjvVmZ88mWP10yv2gTA=; b=LBV4uVezw1JLJrSRHige1NF7Zz+1fBIqafhTbK/N
 8BHx+dI0kk9mxg2PCYPcWfywL1ZRq2lNTW+MBuWKpwkZGyo742bY6yPOviAxrNxV
 qaisDlWVRXFuuImbnSPWNrcAC6a/PgEWudVD6hUQxqJblw0Fyz7bACuyX3F8NXz4
 lDPdPJzKgRXCxaqipfJ5EblBr8HgGZHAw2g6TWqg5Lr010Tek9ftSxYlpGcpDIS6
 ax0fvtSg/GG/ueN14K4N8BKtiMWaanbbNWnIfKYXtoV6eg33tMpZN0LisZisBay2
 onfof01xAxCK55wvbTTHnepZEBPolEevzsHIDMuozdvSmA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52ash90-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 11:42:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e8704e0264so1774967085a.1
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 04:42:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755690155; x=1756294955;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T7wGxRO/zr/otAECRnr8/RO0TjvVmZ88mWP10yv2gTA=;
 b=ul42KrhXKCX6II/3eYoum1nbNmlT3oNtR3tH/4xPfNoxcztYmQ0JyvvvrJKCV4sXpk
 POuOtYz5TjdHy/v28fFUBqGEZNV8Yq91v+lnK/f/3d8dEtCh/F5A7ZNXzxtgaoWJa+xD
 85BkCJ+ADcUyv5xZ08MWMSbZ0Yzii+KmwaXRKVCtV1JNOvclUTNz81uH6cihGUhmtA06
 mj+/b63e9tw7GuBZ2QzftAnekfBfvPEISF3UVdNIqTRssmRVBxicaVjL5IOsy6o0bEEU
 IbKBRHrpA/8FwXfxyynxcWHvj18kvho1GGqDsEIgBtd3QqqEAl9Pr2YNtuacP+svB5AM
 h6Kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJZZA+WNEtTeTIgIvAcJChIhocTaZOFsUexiAUfsqhvm2mne9cJaZWtozIALRHe32Pr7fpSSs27Wk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxKychbtPu21nzGy6Q/qPU+esj5j5OaeOxzD+JTInp+p/KLYSS
 c1O/JiFnrUMQBeSpMlCdtRBaK/OmMCk/isYYmcy/PK+2Ok4URUv4TfNpGEFQTAAJe+cD6BUtShB
 pnVfxDjUocW47elqK7YZE9XyRhUJRIY/JAZ+cGhPZ3nkiYD6NwP6msYmNfpnChcGLlFjdWi0=
X-Gm-Gg: ASbGncv9PBjpSuPj3Yahae1I/y3W0nHhgM2GvT9QYY9FU+b8Do8vfFsQRJ9seQm3Gqs
 E6En3P0bDI+S//nri+2sEQw4l5/N1dx4W+dhx2/PhaupNTB2J8Bo6W0cERy9qI4pTJJwESZlqpX
 En3/GT4+6PgLAOVUsPQHK6slW4/klMg42cJ1lI8pBHUqmlm9VBOxzKu484nl5qpwymMJ8JQX1aO
 LemKn+TBIV/OcS+huO1LG7La3Q1S94Sq7n6+VkSDvoh7vaWn8lNP8fYOIc09NYH1cUtNc489HQU
 Wee8mPv84Ox85n7vSQA+CMRLtpS3/8F2z7Y0BSCS7+q6BGRY9f1n7v3FNkvIACwPRyC+36upy/W
 UwHDF3XEMUELqzL77F/7fWLzwHI4OX7kLEVkG5qdJRW0ipYZZuDLq
X-Received: by 2002:a05:6214:5013:b0:70b:b18b:799e with SMTP id
 6a1803df08f44-70d7711d842mr21451896d6.35.1755690154751; 
 Wed, 20 Aug 2025 04:42:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqvJOideGl/005mWHcWma4BYe+8BY81PBbre7k8yk+HdS2FrnKStdSSCMsolK/tNiWFENdNg==
X-Received: by 2002:a05:6214:5013:b0:70b:b18b:799e with SMTP id
 6a1803df08f44-70d7711d842mr21451386d6.35.1755690154108; 
 Wed, 20 Aug 2025 04:42:34 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3cc97csm2566219e87.80.2025.08.20.04.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 04:42:33 -0700 (PDT)
Date: Wed, 20 Aug 2025 14:42:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
Subject: Re: [PATCH v3 11/14] phy: qcom: qmp-usbc: Finalize USB/DP switchable
 PHY support
Message-ID: <jjsijdmh4hdbgd2boebtrmzvblvhz2hnl7mtv5ga76ine2fnsb@i72dz3r4lbjp>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-11-a43bd25ec39c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-11-a43bd25ec39c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX+uXi/ecVn+aV
 s1gsIDjvVIJHjbG8GiLVpRXOqFvky5cWmC9mIDA4BgHL4p93rur7j586IZWsz2QC2SgpWZk1Em7
 beRt4KFJQNGpbpI18hVo/4NN1VjWavSgNggrdxiTgAnTb+3giX8id3Q/2sCewZQRjunmIR2MNdU
 umoFjvE3tKeBlrSSHxSzEglUEvip8QgOKF0RpSUmZV8w+YL9IFlKyXZ1d9/2jT3y2qEyx0SLVLh
 IP3ZhIN8YbwvHImhFSPrIiXYxFiKe1l5z8UhmdJeZwWrUhzdFPmNm5ViwNaBjstPmrtU0BFM8f/
 YNPi1Lt5F4TKnNRqk3XudylJa0k7UDZyWbv4mM1Hcy/3SJ2eTl4Z20KsZxGYLDQp8ATnASBiVbJ
 jrefshn/BZVAPJGbZula8v2/tHZ3UA==
X-Authority-Analysis: v=2.4 cv=TIIci1la c=1 sm=1 tr=0 ts=68a5b4ab cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=wWkF1u56cBY0eVE_x6kA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: IvjCptoxix9i9r8CVevaZGHLD5XnJ_Gb
X-Proofpoint-GUID: IvjCptoxix9i9r8CVevaZGHLD5XnJ_Gb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

On Wed, Aug 20, 2025 at 05:34:53PM +0800, Xiangxu Yin wrote:
> Complete USB/DP switchable PHY integration by adding DP clock
> registration, aux bridge setup, and DT parsing. Implement clock
> provider logic for USB and DP branches, and extend PHY translation
> to support both USB and DP instances.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 331 ++++++++++++++++++++++++++++---
>  1 file changed, 299 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> index 821398653bef23e1915d9d3a3a2950b0bfbefb9a..74b9f75c8864efe270f394bfbfd748793dada1f5 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> @@ -995,6 +995,11 @@ static int qmp_usbc_usb_power_on(struct phy *phy)
>  	qmp_configure(qmp->dev, qmp->serdes, cfg->serdes_tbl,
>  		      cfg->serdes_tbl_num);
>  
> +	if (IS_ERR(qmp->pipe_clk)) {
> +		return dev_err_probe(qmp->dev, PTR_ERR(qmp->pipe_clk),
> +				     "pipe clock not defined\n");
> +	}

No, this should not be allowed.

> +
>  	ret = clk_prepare_enable(qmp->pipe_clk);
>  	if (ret) {
>  		dev_err(qmp->dev, "pipe_clk enable failed err=%d\n", ret);
> @@ -1365,11 +1370,13 @@ static int __maybe_unused qmp_usbc_runtime_resume(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> -	ret = clk_prepare_enable(qmp->pipe_clk);
> -	if (ret) {
> -		dev_err(dev, "pipe_clk enable failed, err=%d\n", ret);
> -		clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
> -		return ret;
> +	if (!IS_ERR(qmp->pipe_clk)) {

Similarly.

> +		ret = clk_prepare_enable(qmp->pipe_clk);
> +		if (ret) {
> +			dev_err(dev, "pipe_clk enable failed, err=%d\n", ret);
> +			clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
> +			return ret;
> +		}
>  	}
>  
>  	qmp_usbc_disable_autonomous_mode(qmp);
> @@ -1422,9 +1429,23 @@ static int qmp_usbc_clk_init(struct qmp_usbc *qmp)
>  	return devm_clk_bulk_get_optional(dev, num, qmp->clks);
>  }
>  
> -static void phy_clk_release_provider(void *res)
> +static struct clk_hw *qmp_usbc_clks_hw_get(struct of_phandle_args *clkspec, void *data)
>  {
> -	of_clk_del_provider(res);
> +	struct qmp_usbc *qmp = data;
> +
> +	if (clkspec->args_count == 0)
> +		return &qmp->pipe_clk_fixed.hw;
> +
> +	switch (clkspec->args[0]) {
> +	case QMP_USB43DP_USB3_PIPE_CLK:
> +		return &qmp->pipe_clk_fixed.hw;
> +	case QMP_USB43DP_DP_LINK_CLK:
> +		return &qmp->dp_link_hw;
> +	case QMP_USB43DP_DP_VCO_DIV_CLK:
> +		return &qmp->dp_pixel_hw;
> +	}
> +
> +	return ERR_PTR(-EINVAL);
>  }
>  
>  /*
> @@ -1453,8 +1474,11 @@ static int phy_pipe_clk_register(struct qmp_usbc *qmp, struct device_node *np)
>  
>  	ret = of_property_read_string(np, "clock-output-names", &init.name);
>  	if (ret) {
> -		dev_err(qmp->dev, "%pOFn: No clock-output-names\n", np);
> -		return ret;
> +		char name[64];
> +
> +		/* Clock name is not mandatory. */
> +		snprintf(name, sizeof(name), "%s::pipe_clk", dev_name(qmp->dev));
> +		init.name = name;
>  	}
>  
>  	init.ops = &clk_fixed_rate_ops;
> @@ -1463,19 +1487,7 @@ static int phy_pipe_clk_register(struct qmp_usbc *qmp, struct device_node *np)
>  	fixed->fixed_rate = 125000000;
>  	fixed->hw.init = &init;
>  
> -	ret = devm_clk_hw_register(qmp->dev, &fixed->hw);
> -	if (ret)
> -		return ret;
> -
> -	ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get, &fixed->hw);
> -	if (ret)
> -		return ret;
> -
> -	/*
> -	 * Roll a devm action because the clock provider is the child node, but
> -	 * the child node is not actually a device.
> -	 */
> -	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
> +	return devm_clk_hw_register(qmp->dev, &fixed->hw);
>  }
>  
>  #if IS_ENABLED(CONFIG_TYPEC)
> @@ -1660,6 +1672,235 @@ static int qmp_usbc_parse_tcsr(struct qmp_usbc *qmp)
>  	return 0;
>  }
>  
> +static int qmp_usbc_parse_usb3dp_dt(struct qmp_usbc *qmp)
> +{
> +	struct platform_device *pdev = to_platform_device(qmp->dev);
> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> +	const struct qmp_usbc_offsets *offs = cfg->offsets;
> +	struct device *dev = qmp->dev;
> +	void __iomem *base;
> +	int ret;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	qmp->dp_serdes = base + offs->dp_serdes;
> +	qmp->dp_tx = base + offs->dp_txa;
> +	qmp->dp_tx2 = base + offs->dp_txb;
> +	qmp->dp_dp_phy = base + offs->dp_dp_phy;

Squash this into qmp_usbc_parse_dt(). Set these fields if
dp_serdes != 0.

> +	qmp->serdes = base + offs->serdes;
> +	qmp->pcs = base + offs->pcs;
> +	if (offs->pcs_misc)
> +		qmp->pcs_misc = base + offs->pcs_misc;
> +	qmp->tx = base + offs->tx;
> +	qmp->rx = base + offs->rx;
> +
> +	qmp->tx2 = base + offs->tx2;
> +	qmp->rx2 = base + offs->rx2;
> +
> +	ret = qmp_usbc_clk_init(qmp);
> +	if (ret)
> +		return ret;
> +
> +	qmp->pipe_clk = devm_clk_get(dev, "pipe");
> +	if (IS_ERR(qmp->pipe_clk)) {
> +		/* usb3dp allow no pipe clk define */
> +		if (cfg->type == QMP_PHY_USBC_USB3_ONLY)
> +			return dev_err_probe(dev, PTR_ERR(qmp->pipe_clk),
> +						"failed to get pipe clock\n");
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Display Port PLL driver block diagram for branch clocks
> + *
> + *              +------------------------------+
> + *              |         DP_VCO_CLK           |
> + *              |                              |
> + *              |    +-------------------+     |
> + *              |    |   (DP PLL/VCO)    |     |
> + *              |    +---------+---------+     |
> + *              |              v               |
> + *              |   +----------+-----------+   |
> + *              |   | hsclk_divsel_clk_src |   |
> + *              |   +----------+-----------+   |
> + *              +------------------------------+
> + *                              |
> + *          +---------<---------v------------>----------+
> + *          |                                           |
> + * +--------v----------------+                          |
> + * |    dp_phy_pll_link_clk  |                          |
> + * |     link_clk            |                          |
> + * +--------+----------------+                          |
> + *          |                                           |
> + *          |                                           |
> + *          v                                           v
> + * Input to DISPCC block                                |
> + * for link clk, crypto clk                             |
> + * and interface clock                                  |
> + *                                                      |
> + *                                                      |
> + *      +--------<------------+-----------------+---<---+
> + *      |                     |                 |
> + * +----v---------+  +--------v-----+  +--------v------+
> + * | vco_divided  |  | vco_divided  |  | vco_divided   |
> + * |    _clk_src  |  |    _clk_src  |  |    _clk_src   |
> + * |              |  |              |  |               |
> + * |divsel_six    |  |  divsel_two  |  |  divsel_four  |
> + * +-------+------+  +-----+--------+  +--------+------+
> + *         |                 |                  |
> + *         v---->----------v-------------<------v
> + *                         |
> + *              +----------+-----------------+
> + *              |   dp_phy_pll_vco_div_clk   |
> + *              +---------+------------------+
> + *                        |
> + *                        v
> + *              Input to DISPCC block
> + *              for DP pixel clock
> + *
> + */
> +static int qmp_dp_pixel_clk_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
> +{
> +	switch (req->rate) {
> +	case 1620000000UL / 2:
> +	case 2700000000UL / 2:
> +	/* 5.4 and 8.1 GHz are same link rate as 2.7GHz, i.e. div 4 and div 6 */
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static unsigned long qmp_dp_pixel_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
> +{
> +	const struct qmp_usbc *qmp;
> +	const struct phy_configure_opts_dp *dp_opts;
> +
> +	qmp = container_of(hw, struct qmp_usbc, dp_pixel_hw);
> +
> +	dp_opts = &qmp->dp_opts;
> +
> +	switch (dp_opts->link_rate) {
> +	case 1620:
> +		return 1620000000UL / 2;
> +	case 2700:
> +		return 2700000000UL / 2;
> +	case 5400:
> +		return 5400000000UL / 4;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static const struct clk_ops qmp_dp_pixel_clk_ops = {
> +	.determine_rate	= qmp_dp_pixel_clk_determine_rate,
> +	.recalc_rate	= qmp_dp_pixel_clk_recalc_rate,
> +};
> +
> +static int qmp_dp_link_clk_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
> +{
> +	switch (req->rate) {
> +	case 162000000:
> +	case 270000000:
> +	case 540000000:
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static unsigned long qmp_dp_link_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
> +{
> +	const struct qmp_usbc *qmp;
> +	const struct phy_configure_opts_dp *dp_opts;
> +
> +	qmp = container_of(hw, struct qmp_usbc, dp_link_hw);
> +	dp_opts = &qmp->dp_opts;
> +
> +	switch (dp_opts->link_rate) {
> +	case 1620:
> +	case 2700:
> +	case 5400:
> +		return dp_opts->link_rate * 100000;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static const struct clk_ops qmp_dp_link_clk_ops = {
> +	.determine_rate	= qmp_dp_link_clk_determine_rate,
> +	.recalc_rate	= qmp_dp_link_clk_recalc_rate,
> +};
> +
> +static int phy_dp_clks_register(struct qmp_usbc *qmp, struct device_node *np)
> +{
> +	struct clk_init_data init = { };
> +	char name[64];
> +	int ret;
> +
> +	snprintf(name, sizeof(name), "%s::link_clk", dev_name(qmp->dev));
> +	init.ops = &qmp_dp_link_clk_ops;
> +	init.name = name;
> +	qmp->dp_link_hw.init = &init;
> +	ret = devm_clk_hw_register(qmp->dev, &qmp->dp_link_hw);
> +	if (ret < 0) {
> +		dev_err(qmp->dev, "link clk reg fail ret=%d\n", ret);
> +		return ret;
> +	}
> +
> +	snprintf(name, sizeof(name), "%s::vco_div_clk", dev_name(qmp->dev));
> +	init.ops = &qmp_dp_pixel_clk_ops;
> +	init.name = name;
> +	qmp->dp_pixel_hw.init = &init;
> +	ret = devm_clk_hw_register(qmp->dev, &qmp->dp_pixel_hw);
> +	if (ret) {
> +		dev_err(qmp->dev, "pxl clk reg fail ret=%d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int qmp_usbc_register_clocks(struct qmp_usbc *qmp, struct device_node *np)
> +{
> +	int ret;
> +
> +	if (!IS_ERR(qmp->pipe_clk)) {
> +		ret = phy_pipe_clk_register(qmp, np);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (qmp->cfg->type == QMP_PHY_USBC_USB3_DP) {

if dp_serdes != 0

> +		ret = phy_dp_clks_register(qmp, np);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return devm_of_clk_add_hw_provider(qmp->dev, qmp_usbc_clks_hw_get, qmp);
> +}
> +
> +static struct phy *qmp_usbc_phy_xlate(struct device *dev, const struct of_phandle_args *args)
> +{
> +	struct qmp_usbc *qmp = dev_get_drvdata(dev);
> +
> +	if (args->args_count == 0)
> +		return qmp->usb_phy;
> +
> +	switch (args->args[0]) {
> +	case QMP_USB43DP_USB3_PHY:
> +		return qmp->usb_phy;
> +	case QMP_USB43DP_DP_PHY:
> +		return qmp->dp_phy;
> +	}
> +
> +	return ERR_PTR(-EINVAL);
> +}
> +
>  static int qmp_usbc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -1703,16 +1944,32 @@ static int qmp_usbc_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	/* Check for legacy binding with child node. */
> -	np = of_get_child_by_name(dev->of_node, "phy");
> -	if (np) {
> -		ret = qmp_usbc_parse_usb_dt_legacy(qmp, np);
> -	} else {
> +	if (qmp->cfg->type == QMP_PHY_USBC_USB3_DP) {

Should not be necessary.

>  		np = of_node_get(dev->of_node);
> -		ret = qmp_usbc_parse_usb_dt(qmp);
> +
> +		ret = qmp_usbc_parse_usb3dp_dt(qmp);
> +		if (ret) {
> +			dev_err(qmp->dev, "parse DP dt fail ret=%d\n", ret);
> +			goto err_node_put;
> +		}
> +
> +		ret = drm_aux_bridge_register(dev);
> +		if (ret) {
> +			dev_err(qmp->dev, "aux bridge reg fail ret=%d\n", ret);
> +			goto err_node_put;
> +		}
> +	} else {
> +		/* Check for legacy binding with child node. */
> +		np = of_get_child_by_name(dev->of_node, "phy");
> +		if (np) {
> +			ret = qmp_usbc_parse_usb_dt_legacy(qmp, np);
> +		} else {
> +			np = of_node_get(dev->of_node);
> +			ret = qmp_usbc_parse_usb_dt(qmp);
> +		}
> +		if (ret)
> +			goto err_node_put;
>  	}
> -	if (ret)
> -		goto err_node_put;
>  
>  	pm_runtime_set_active(dev);
>  	ret = devm_pm_runtime_enable(dev);
> @@ -1724,7 +1981,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
>  	 */
>  	pm_runtime_forbid(dev);
>  
> -	ret = phy_pipe_clk_register(qmp, np);
> +	ret = qmp_usbc_register_clocks(qmp, np);
>  	if (ret)
>  		goto err_node_put;
>  
> @@ -1737,9 +1994,19 @@ static int qmp_usbc_probe(struct platform_device *pdev)
>  
>  	phy_set_drvdata(qmp->usb_phy, qmp);
>  
> +	if (qmp->cfg->type == QMP_PHY_USBC_USB3_DP) {

if dp_serdes != 0

> +		qmp->dp_phy = devm_phy_create(dev, np, &qmp_usbc_dp_phy_ops);
> +		if (IS_ERR(qmp->dp_phy)) {
> +			ret = PTR_ERR(qmp->dp_phy);
> +			dev_err(dev, "failed to create PHY: %d\n", ret);
> +			goto err_node_put;
> +		}
> +		phy_set_drvdata(qmp->dp_phy, qmp);
> +	}
> +
>  	of_node_put(np);
>  
> -	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +	phy_provider = devm_of_phy_provider_register(dev, qmp_usbc_phy_xlate);
>  
>  	return PTR_ERR_OR_ZERO(phy_provider);
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
