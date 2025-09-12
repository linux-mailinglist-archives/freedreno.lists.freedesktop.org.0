Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F370BB54C09
	for <lists+freedreno@lfdr.de>; Fri, 12 Sep 2025 14:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD8C10E1B7;
	Fri, 12 Sep 2025 12:00:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Keedpf5m";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A7710EC43
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 12:00:25 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fJ0t014003
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 12:00:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fbBQL65dyCJpo/jAgC2RKL4WsdEtpLaJgdDVpNQP4NA=; b=Keedpf5mlpgcIkD+
 kDlz7ZTUS/GMyUZP4hTjgU1J7kEYbELo33PxmI1qoIOOIuqZ274iKcjMbiED3y9a
 cXheoqcb9eGFgzDqict5bl1Iz04QbYssVvyrkxVGFfqc+jivMGXo24UXSgeT4RMP
 tXw34l04FRXvKFKRTLnrN6UD1AWaxI2Yc1rTnBhFdG9g7v6Aqfqs3hYlRfT4Jk13
 +zWPoZSB5BOuw3uxvIXF7o+tZOJqO6JEpSNJIzNEkf02hT8M3xLmZpEZusf6rX86
 U5EiOS5PHGqz4sqmIcIYHhI2hTEYm+BczH8n2KohTs/Dnj2cJH4CK/In8qTRQ3vZ
 285ZVg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493qphw8q1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 12:00:24 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b54aa407bc7so255181a12.1
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 05:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757678423; x=1758283223;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fbBQL65dyCJpo/jAgC2RKL4WsdEtpLaJgdDVpNQP4NA=;
 b=Glsz2uAdmCbuF6f452zoI/EH8r/t0ib0Xxc+Wxp2mWp5jE8Q2wrIgcKokO3H+y/TzP
 z4t/LAR2SU+nk/5Qm3fOmub+tabgPzJPq1FB3oZlBoUvYfeiKspuDn2jBibmQxD/cnPW
 YFnBhnL1SC2jskxlFnVuP2bvZVK0hoxMe610srKiP7SWiDxkNYoNJAiUw0wdw+gfPEZx
 5YlqZDgnFTH/P2nqCzFFYQ6jeUh4BraGVg79469w3DiQm7/rodSKkko9PHcG88uk7M+e
 epli+zZ0fWzwDqxKUtsFCrB3UK7DaD/VruziYREdq0TnEV0JJ8zhxzc9bWG8AaWYT/5e
 dd2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiX2bwXqdysMn5/2mmKLWC0nGAMtIpgmqVYpVfm7EAk9gO1piWP25QYNwz/Dot4qGbBzZVlP5iPiw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuHtNHtc9l6MUMGDBPDavNSQajA7TjLzya6njgi7wxJ7203fbt
 U2T9wrqxXASflPDeE8Q3MmlAO2Fqc2Kwa/1S7/OCqjrtfX7QV45PzqnIhFNfiYH6ft7cLMj6O+H
 YcnjSNtQFcjB6gcI+jfKBtCl2LmjdncznQ5ps2vElB/AFU3ckskzNLjqKErF6g7neVDAjxa0=
X-Gm-Gg: ASbGnctq8U7Gtnjn8PbN8Al5EFCn2P9tMdQXVTH1CkmGLaxpXs472cau2ut8ta8ph9S
 gjfabKIxpZVQb5hoc9UvEsoHjkQdjQF6zf6q1OzAfd91KAGqeWBVViEIbbib74EQO5f4rzST0iZ
 TmPHLchevK1xLLHvqNB79u3eZv+WeZECx5RxVuihHkq43LDnAD1zPUu3hcQSQXWWOg/vlewE4FS
 mZFEyf6eTyNdZm8boB05XAB1TLkSl9/2vItRx8CTq9aVNOQYKOZl+ZZSzFz56XdHr72qQuoW2/v
 V8V2Pl7DXVNwhqtbxvcMPgrUCOjNU+CNkWk8bllI0YQCDseO54I0FI8o6EOhN+IWAllIhhh0orE
 pAcQM3nDE/8UBU4L/cCRC+l3Iee6kRg==
X-Received: by 2002:a05:6a20:914c:b0:251:31a0:9e70 with SMTP id
 adf61e73a8af0-2602cb012a7mr2002340637.7.1757678422891; 
 Fri, 12 Sep 2025 05:00:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHa0BAZWf24zn+3+8j1WAhgOyGQF6J2BOIlcR+w56DOk0y+/cmniHka/roP1NPgCXMPeqLmCw==
X-Received: by 2002:a05:6a20:914c:b0:251:31a0:9e70 with SMTP id
 adf61e73a8af0-2602cb012a7mr2002298637.7.1757678422247; 
 Fri, 12 Sep 2025 05:00:22 -0700 (PDT)
Received: from [10.133.33.174] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-77607a47601sm5176550b3a.28.2025.09.12.05.00.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Sep 2025 05:00:21 -0700 (PDT)
Message-ID: <335ffce5-19c6-409d-8386-686fe9e5dea5@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 20:00:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/13] phy: qcom: qmp-usbc: Add USB/DP switchable PHY
 clk register
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-8-2702bdda14ed@oss.qualcomm.com>
 <6p43oxn57kke5eotoqtt5gqtmhmgeteoymewqm3ko5q5veyegs@krkh4dwdno5i>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <6p43oxn57kke5eotoqtt5gqtmhmgeteoymewqm3ko5q5veyegs@krkh4dwdno5i>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aPDwqa9m c=1 sm=1 tr=0 ts=68c40b58 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=kyIpQUSdGz_7SAUQDtwA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: iGLG3Z73T52oUB13a86hZxfRJX66Y7A1
X-Proofpoint-ORIG-GUID: iGLG3Z73T52oUB13a86hZxfRJX66Y7A1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDA0MCBTYWx0ZWRfX3mOF9zfZ5n6y
 tU5XItbwYAu++BvpbY9tDm1oVNg4locGeRS99ViSQrHWvw9k8Q75O4UbvLprfpXu446YLI04g1V
 Ft/iI4W8uX3SjCSiBoT3zacRxkvK3yv/GvIO9EQrFtH+DRdM8TXT5557MiSIbxw3GZK6+HtGVJ9
 uyavvTN8OcQ9fn8wlcolGO/Erah3vZ3YCQLOKTTg5kL2HbQMVYEqC5EE0WYNgYx8LpqMn8KU3H2
 4Vv5Jtt/2l2xQYxdtypcSQfiqfp0QUypYhCY2CxqHY0V95IQjywlzzuuO4kLVyUg3EEZw8t18/G
 vkQW/u+bqPY3k7ntUmQtNUTLeAaKOgKc7qymDnmY0g00RAphqsPpRf3SlzYrHE3sZvM+fZD9/zQ
 fje0Blvy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509110040
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


On 9/12/2025 6:19 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 10:55:05PM +0800, Xiangxu Yin wrote:
>> Add USB/DP switchable PHY clock registration and DT parsing for DP offsets.
>> Extend qmp_usbc_register_clocks and clock provider logic to support both
>> USB and DP instances.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 208 +++++++++++++++++++++++++++++--
>>  1 file changed, 195 insertions(+), 13 deletions(-)
>>
>> @@ -1276,8 +1291,11 @@ static int phy_pipe_clk_register(struct qmp_usbc *qmp, struct device_node *np)
>>  
>>  	ret = of_property_read_string(np, "clock-output-names", &init.name);
>>  	if (ret) {
>> -		dev_err(qmp->dev, "%pOFn: No clock-output-names\n", np);
>> -		return ret;
>> +		char name[64];
>> +
>> +		/* Clock name is not mandatory. */
>> +		snprintf(name, sizeof(name), "%s::pipe_clk", dev_name(qmp->dev));
>> +		init.name = name;
>>  	}
> Do we have any guarantees that memory for 'name' exists beyond this point?


If the previous of_property_read_string() call succeeded, could 'name'
still be empty? or you means 'char name[64]' will be release after '}'?

From local verification, I can see 88e8000.phy::pipe_clk node from clk_summary.


>>  
>>  	init.ops = &clk_fixed_rate_ops;
>> @@ -1286,19 +1304,176 @@ static int phy_pipe_clk_register(struct qmp_usbc *qmp, struct device_node *np)
>>  	fixed->fixed_rate = 125000000;
>>  	fixed->hw.init = &init;
>>  
>> -	ret = devm_clk_hw_register(qmp->dev, &fixed->hw);
>> -	if (ret)
>> +	return devm_clk_hw_register(qmp->dev, &fixed->hw);
>> +}
>> +
>> +
>> +/*
>> + * Display Port PLL driver block diagram for branch clocks
>> + *
>> + *              +------------------------------+
>> + *              |         DP_VCO_CLK           |
>> + *              |                              |
>> + *              |    +-------------------+     |
>> + *              |    |   (DP PLL/VCO)    |     |
>> + *              |    +---------+---------+     |
>> + *              |              v               |
>> + *              |   +----------+-----------+   |
>> + *              |   | hsclk_divsel_clk_src |   |
>> + *              |   +----------+-----------+   |
>> + *              +------------------------------+
>> + *                              |
>> + *          +---------<---------v------------>----------+
>> + *          |                                           |
>> + * +--------v----------------+                          |
>> + * |    dp_phy_pll_link_clk  |                          |
>> + * |     link_clk            |                          |
>> + * +--------+----------------+                          |
>> + *          |                                           |
>> + *          |                                           |
>> + *          v                                           v
>> + * Input to DISPCC block                                |
>> + * for link clk, crypto clk                             |
>> + * and interface clock                                  |
>> + *                                                      |
>> + *                                                      |
>> + *      +--------<------------+-----------------+---<---+
>> + *      |                     |                 |
>> + * +----v---------+  +--------v-----+  +--------v------+
>> + * | vco_divided  |  | vco_divided  |  | vco_divided   |
>> + * |    _clk_src  |  |    _clk_src  |  |    _clk_src   |
>> + * |              |  |              |  |               |
>> + * |divsel_six    |  |  divsel_two  |  |  divsel_four  |
>> + * +-------+------+  +-----+--------+  +--------+------+
>> + *         |                 |                  |
>> + *         v---->----------v-------------<------v
>> + *                         |
>> + *              +----------+-----------------+
>> + *              |   dp_phy_pll_vco_div_clk   |
>> + *              +---------+------------------+
>> + *                        |
>> + *                        v
>> + *              Input to DISPCC block
>> + *              for DP pixel clock
>> + *
>> + */
>> +static int qmp_dp_pixel_clk_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
>> +{
>> +	switch (req->rate) {
>> +	case 1620000000UL / 2:
>> +	case 2700000000UL / 2:
>> +	/* 5.4 and 8.1 GHz are same link rate as 2.7GHz, i.e. div 4 and div 6 */
>> +		return 0;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +}
>> +
>> +static unsigned long qmp_dp_pixel_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
>> +{
>> +	const struct qmp_usbc *qmp;
>> +	const struct phy_configure_opts_dp *dp_opts;
>> +
>> +	qmp = container_of(hw, struct qmp_usbc, dp_pixel_hw);
>> +
>> +	dp_opts = &qmp->dp_opts;
>> +
>> +	switch (dp_opts->link_rate) {
>> +	case 1620:
>> +		return 1620000000UL / 2;
>> +	case 2700:
>> +		return 2700000000UL / 2;
>> +	case 5400:
>> +		return 5400000000UL / 4;
> No HBR3 support? Then why was it mentioned few lines above?
>
>> +	default:
>> +		return 0;
>> +	}
>> +}
>> +
>
>> +static int qmp_usbc_register_clocks(struct qmp_usbc *qmp, struct device_node *np)
>> +{
>> +	int ret;
>>  
>> -	ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get, &fixed->hw);
>> +	ret = phy_pipe_clk_register(qmp, np);
>>  	if (ret)
>>  		return ret;
>>  
>> -	/*
>> -	 * Roll a devm action because the clock provider is the child node, but
>> -	 * the child node is not actually a device.
>> -	 */
>> -	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
>> +	if (qmp->dp_serdes != 0) {
>> +		ret = phy_dp_clks_register(qmp, np);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return devm_of_clk_add_hw_provider(qmp->dev, qmp_usbc_clks_hw_get, qmp);
> Do you understand what did the comment (that you've removed) say? And
> why?
>
>>  }
>>  
>>  #if IS_ENABLED(CONFIG_TYPEC)
>> @@ -1429,6 +1604,13 @@ static int qmp_usbc_parse_dt(struct qmp_usbc *qmp)
>>  	if (IS_ERR(base))
>>  		return PTR_ERR(base);
>>  
>> +	if (offs->dp_serdes != 0) {
>> +		qmp->dp_serdes = base + offs->dp_serdes;
>> +		qmp->dp_tx = base + offs->dp_txa;
>> +		qmp->dp_tx2 = base + offs->dp_txb;
>> +		qmp->dp_dp_phy = base + offs->dp_dp_phy;
>> +	}
>> +
>>  	qmp->serdes = base + offs->serdes;
>>  	qmp->pcs = base + offs->pcs;
>>  	if (offs->pcs_misc)
>> @@ -1537,7 +1719,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
>>  	 */
>>  	pm_runtime_forbid(dev);
>>  
>> -	ret = phy_pipe_clk_register(qmp, np);
>> +	ret = qmp_usbc_register_clocks(qmp, np);
>>  	if (ret)
>>  		goto err_node_put;
>>  
>>
>> -- 
>> 2.34.1
>>
