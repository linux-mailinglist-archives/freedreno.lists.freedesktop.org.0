Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10787D1EBFA
	for <lists+freedreno@lfdr.de>; Wed, 14 Jan 2026 13:29:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D856A10E606;
	Wed, 14 Jan 2026 12:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CYCGXGCX";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="khjzWNWB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3F710E173
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 07:12:38 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60E665Wt2816677
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 07:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Fq4a38fiWnx2ftPjHIPdlFRol4VhEcllxEgvdPr2E2A=; b=CYCGXGCXwtBGAyv4
 ZbtZWa5OLlMJxC3Wmi9roBToVjfhdOnA6LlX10cPNqohCnu0wJnG+FlnMtAg6ucH
 l2alwITHDMLsxWM2hN0OHk3CM0srY6hvxXau2TJA2lWl3vzvOYzXwj8iMGjPlgHA
 EBABpf/7G7z7HytjIor/TBm18e58ekPD5DpX9cmQ3J6fzGTHnx6zXM8agkhNWP4r
 MKPLWm/sAfs4DV6UTVwz4PSewnfAAgG0Y9rU7tCE0RR6QMTlEIG7TpBl7l7DJzvf
 WIWUHB0pNIe1C7III50BqKA58bYOSvXQCqWLhJG3b870B5a4BXv8u4mlgY80doj4
 0mVb6A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bny89hfb9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 07:12:37 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-c52ab75d57cso3772096a12.1
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 23:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768374757; x=1768979557;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Fq4a38fiWnx2ftPjHIPdlFRol4VhEcllxEgvdPr2E2A=;
 b=khjzWNWBqYP9cT/WY4Nprp33VqPkTzsmIMB4beMxOVN506Sw902xwiy7HF5lGtBQ1U
 +V18RorRUWsEmYNYA3gGeTbcwPwsOixi8A7aEmlFPGyOe3FFwqd159BgD3iUdqR1tziF
 hV/lCJ/45upOPDHbuMjQfPGCfwPE5xJByFaJ47ov/voPQrMXAY4XRSFFYMJp0wShxg43
 hGpXDdvSCHeDFlQOEKTTT0ahxROLUKUen45W6uqG0TF25vvA8CAhPHZFs5atvz1b2MDg
 gxV01HACDJRtWXKd3ssduYUd4NhOqMHLwI/91J2VZrMUSuX9GyWkZgW2uvTH8eregSD3
 89hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768374757; x=1768979557;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fq4a38fiWnx2ftPjHIPdlFRol4VhEcllxEgvdPr2E2A=;
 b=l8gUBGlaDH03/GEk9NeVvnykLAdrwvBMYBSCxAcHuMXVkSipbwzpJfLYwMcb2YK+Ty
 LsquEK2cbjrB7j4KMtJoZ4+eaB9U9bZjktVvIKL1QM35orMYYuaCSx0OD3vfpPBdazkb
 LDOxpek4XaKre4xvrqQWLyrPt1EwB6Zz3zF4fxPSGD4+oWOI1H6lroyN23QnswvtpV4r
 3VMYN4vgbi5n43a6XTxGpWGrO+o6/UDYlmIv3hRzw4lBv7OXK5FNsSuCWU4NfDEj4ssn
 3/VcQCA5u/bsgiU5JoUp6hznZE1jUpRZR2IxWGBg+4yqRfXHnQ2+r6ZIkQLPAQq+Y4cb
 uL2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWZVhJAAwAO+AfwIZijBSm/FAsuapexG4sNzLbMlRH1TNLoCWzWDvnBwQiplC41bnlC0d2v/HGm8c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcdB2ujajHg9QpdgmcLYA8xkkA/HnADw+KCoIIQMMlVr5YZElX
 JasxksCVCFZr44+enqa7m0QCOQtxSISEFNUNqGJy5YN2w4clmpDu2yHjE1HajgN97ZKi73jd5lX
 q8nTQ6jvJjnjlVvEORsIVu5Qu5OPu8mJkZL8QbKvAun5pTpEJZkcoBqZgkYwc18jIjRfdAec=
X-Gm-Gg: AY/fxX7iDfmO9f+H7jqDRM2dxFcgACWflnPe+5xSLgf2YMVh3THhKH1fPTGmcjPMPDP
 EadIJxa42f6EOyYKXzKXDuzr1AJtOBszMV6Vo/KadFz8yUOl3NCgt5wxv3b1YjwoGiPv1UPWlkI
 nGLORQcAJRPVQ/tctBAAk+EF4bvm0joThb1PfjyGrgF7PPvc6Q3QjGF2i/8MIrGJ3cLk50gIABY
 t7/x9wi5/UmhPjsONXSpVT97cXN/JmoxMZD38XyQspoalaJhmDfwB22rUNVsU7BCFuzJJ/A7BY7
 Q8RYLaqsCLJx0ybDtGj31FuH98/3x7OQHjKpUKg2TgKmeczKWtR39v/BptDx8D1J5P68mSuhkNc
 dMfbmLts6vOvNvWgpNf85XDXe0w6x1rOMY/J+ke63prjw
X-Received: by 2002:a17:903:b0f:b0:2a0:d364:983b with SMTP id
 d9443c01a7336-2a599e5cb87mr14570275ad.60.1768374756700; 
 Tue, 13 Jan 2026 23:12:36 -0800 (PST)
X-Received: by 2002:a17:903:b0f:b0:2a0:d364:983b with SMTP id
 d9443c01a7336-2a599e5cb87mr14570035ad.60.1768374756186; 
 Tue, 13 Jan 2026 23:12:36 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3c49299sm215214325ad.42.2026.01.13.23.12.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 23:12:35 -0800 (PST)
Message-ID: <82f03ed2-bec6-01c8-8ede-d4c4c406cdd6@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 12:42:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 03/11] media: iris: retrieve UBWC platform configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
 <20260113-iris-ubwc-v2-3-4346a6ef07a9@oss.qualcomm.com>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-3-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA1NSBTYWx0ZWRfX4McJRU1/w641
 HlES7E/DFo74MSKBXxaA2SMKaUqbLZ7iMXT8jaDBqpUXTlw20YUzmPbUToCSl2mYctw764y8LP0
 UsfFvN5mzeOOGsFNXTQmHmd2B9APHVpk15BMJjPtVvImQ62XB3j/19YUruo1fIRxsyPx/sSGPdr
 lWj1wniFaLaquFlv3f2Q7ypPzdq26W67PODQPJASfe5H/QcaP1vayED3fyrkjF1IYefzOnm6Yqf
 TdNW7kFvFMCm4qq+0kH8OmveAZ0oVFLzj3BgAxk+Z/KWXdTsVOs5i6U9/y68udPzZBGozknpFX3
 /xTbxA72Ii3Q40yMtlK97mFxHPZ17oLi27xvWRTVMLG/vc5VMz/0Lcx6Wt/wGtynUYR24rCuwAY
 Ch6nE/EGSJ6P2+L6y2/E4raOom5Dd5gRvJ3sHFVSZXNIAtRtraUaSFefrxYP32pvJNgZA7PTmEA
 hOti2YJoEPPTuECUxzA==
X-Proofpoint-ORIG-GUID: JOpn5d-Bwn6mkgTQz2VX-G3jkb-ca-Gj
X-Authority-Analysis: v=2.4 cv=efEwvrEH c=1 sm=1 tr=0 ts=696741e5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Hb1tMkpcLnUKv6SOSUkA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: JOpn5d-Bwn6mkgTQz2VX-G3jkb-ca-Gj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1011 malwarescore=0
 suspectscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140055
X-Mailman-Approved-At: Wed, 14 Jan 2026 12:29:35 +0000
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



On 1/13/2026 10:27 PM, Dmitry Baryshkov wrote:
> Specifying UBWC data in each driver doesn't scale and is prone to
> errors. Request UBWC data from the central database in preparation to
> using it through the rest of the driver.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/Kconfig      | 1 +
>  drivers/media/platform/qcom/iris/iris_core.h  | 4 ++++
>  drivers/media/platform/qcom/iris/iris_probe.c | 5 +++++
>  3 files changed, 10 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
> index 3c803a05305a..39b06de6c3e6 100644
> --- a/drivers/media/platform/qcom/iris/Kconfig
> +++ b/drivers/media/platform/qcom/iris/Kconfig
> @@ -5,6 +5,7 @@ config VIDEO_QCOM_IRIS
>          select V4L2_MEM2MEM_DEV
>          select QCOM_MDT_LOADER if ARCH_QCOM
>          select QCOM_SCM
> +        select QCOM_UBWC_CONFIG
>          select VIDEOBUF2_DMA_CONTIG
>          help
>            This is a V4L2 driver for Qualcomm iris video accelerator
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index fb194c967ad4..d10a03aa5685 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -30,6 +30,8 @@ enum domain_type {
>  	DECODER	= BIT(1),
>  };
>  
> +struct qcom_ubwc_cfg_data;
> +
>  /**
>   * struct iris_core - holds core parameters valid for all instances
>   *
> @@ -52,6 +54,7 @@ enum domain_type {
>   * @resets: table of iris reset clocks
>   * @controller_resets: table of controller reset clocks
>   * @iris_platform_data: a structure for platform data
> + * @ubwc_cfg: UBWC configuration for the platform
>   * @state: current state of core
>   * @iface_q_table_daddr: device address for interface queue table memory
>   * @sfr_daddr: device address for SFR (Sub System Failure Reason) register memory
> @@ -95,6 +98,7 @@ struct iris_core {
>  	struct reset_control_bulk_data		*resets;
>  	struct reset_control_bulk_data		*controller_resets;
>  	const struct iris_platform_data		*iris_platform_data;
> +	const struct qcom_ubwc_cfg_data		*ubwc_cfg;
>  	enum iris_core_state			state;
>  	dma_addr_t				iface_q_table_daddr;
>  	dma_addr_t				sfr_daddr;
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 9bc9b34c2576..85e531b35ecf 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -10,6 +10,7 @@
>  #include <linux/pm_opp.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
> +#include <linux/soc/qcom/ubwc.h>
>  
>  #include "iris_core.h"
>  #include "iris_ctrls.h"
> @@ -248,6 +249,10 @@ static int iris_probe(struct platform_device *pdev)
>  
>  	core->iris_platform_data = of_device_get_match_data(core->dev);
>  
> +	core->ubwc_cfg = qcom_ubwc_config_get_data();
> +	if (IS_ERR(core->ubwc_cfg))
> +		return PTR_ERR(core->ubwc_cfg);
> +
>  	ret = devm_request_threaded_irq(core->dev, core->irq, iris_hfi_isr,
>  					iris_hfi_isr_handler, IRQF_TRIGGER_HIGH, "iris", core);
>  	if (ret)
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita
