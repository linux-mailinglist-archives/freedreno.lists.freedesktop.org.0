Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B849EFD04
	for <lists+freedreno@lfdr.de>; Thu, 12 Dec 2024 21:10:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7584110E146;
	Thu, 12 Dec 2024 20:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aY3CVRav";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F05B10E062
 for <freedreno@lists.freedesktop.org>; Thu, 12 Dec 2024 20:10:36 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCHaixA026866
 for <freedreno@lists.freedesktop.org>; Thu, 12 Dec 2024 20:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wjxdlbcMpRCGG5unqfq3EXNXD44+uKiRk9D5zjKJmC4=; b=aY3CVRavkb2m86db
 oStn4v46CvjwrtNysBCaNcrfKEpByuJZ4R7HlazTkpPTsjijt0XhK4X8cbtc5+Dk
 AZ6j6ZWgWz8sncinaqoR265Xw/Ox2yeg384Zd0CXn+pgsYy0fvykKkai9ZrsrlCB
 Y8tUDVBLwN/m7f6Rn9yxGCkhSvc3gB2KhbC5MdDiph20QqpoxGoocrisZWQU/TVy
 y0BFqJ9nodlUlJrdXfLWfKl58ediBgCtXGwRKqTZJu3icEIV3zXA5qsIqN53k1am
 z96+7/KxbZD0nA4XVkeGMxPMga1mQS3/Tas1R7FYLZq1kgUVDdKWPTlvP3Z7Ub+I
 RjA9Qg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fd40m58w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 12 Dec 2024 20:10:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7b66edf3284so4908185a.2
 for <freedreno@lists.freedesktop.org>; Thu, 12 Dec 2024 12:10:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734034234; x=1734639034;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wjxdlbcMpRCGG5unqfq3EXNXD44+uKiRk9D5zjKJmC4=;
 b=HjxMZOzWyxTs9324yFgoffYt6cVcUNWDHfE0STHrE/P9FtCwiN+lFILQvmnJ70nWHh
 ZYX07Cm36wik4gOJa076eTolSIZFYpb044O93rGGd4OmuhemiLyOsjP1qSQwHVqHqQDn
 mGVZJoaHr856VJzeZSG8yVEaC05RkepCAe8iWl0iBmj3N8QMAe+T51E14HFWUlCepe7o
 6sVpg9NHALnOb97/x1aSWDUMrHAab07epxO+na/bOkpHsgub0AyPX/WTBWnPR3InNH/G
 samn1oAuhWU0Q08g1pAutOTNQB6P4mBSyLaZ0TIHvkYkvnMjESr1UD4a6m1RUTzvcj+M
 oXVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCgZYjy159UWP7xVklba6iA1WQMIf1jEIkZh67D3yH4PGaPTJ4YsbSGplYCMunqiY+Zp7ofG2FZSY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbfLU7IkBQRszI57QPZqP7Wlg1plUt5D+m0Z1D0y3ZqRjMP/PU
 pkIF8M1DExsSCTbOhixWxpQVqimoHc2AkE059fNXjbdJbINqQHkoVd9iydKj5qILoIZGtce00oe
 vEHeqe87N+kwYoKnucDphVyLnqQUa4x0yCa40TnEIUuGexk7/v8X/jKLjAvl2Ce5yswQ=
X-Gm-Gg: ASbGnctp0HYhZd+b1+oKMGWBS2Ecwv9wZw0gdR723YaZCgVZOsNfRznpU6OhxBAvjT6
 IKLPIFYXK9QcIVUGVpg7SQinCjLVKlc4WaC2rOr4cBadfm1QC5Kfbo6nIcsAoi7LE1JhuVEAlWj
 FV4gqJw3ByqYyPM3sbH9tTPeZ7ikNtKuEUWFjshv9L1hyjKSPytf2ey72hXvzy8GyV0VzOc6ksP
 y1U9SgGMYjW3dSll47mbOsgRUAziKQzc1+hLXbkI9pt7YefBHr5oDVxgv6s/eaaS33RtYWmHmCB
 cN2tucuFdJw2tP2KQyBaiR1xRkcMfwgLk9JagA==
X-Received: by 2002:a05:620a:1998:b0:7b6:c6f8:1d28 with SMTP id
 af79cd13be357-7b6f87dd72amr93234385a.0.1734034234221; 
 Thu, 12 Dec 2024 12:10:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFyzEVU0feNufWuqaCY2OmYtIxnwTgK6tLBBZR+CdrFuuWuQrx4v5hWbS4yj4xOP2wEBnv9CQ==
X-Received: by 2002:a05:620a:1998:b0:7b6:c6f8:1d28 with SMTP id
 af79cd13be357-7b6f87dd72amr93231885a.0.1734034233815; 
 Thu, 12 Dec 2024 12:10:33 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3ecef4c07sm7164140a12.1.2024.12.12.12.10.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 12:10:32 -0800 (PST)
Message-ID: <8d854f93-36da-4779-9ab0-381912aef4b4@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 21:10:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/7] drm/msm: adreno: dynamically generate GMU bw table
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
 <20241211-topic-sm8x50-gpu-bw-vote-v5-3-6112f9f785ec@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241211-topic-sm8x50-gpu-bw-vote-v5-3-6112f9f785ec@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cV1Jyr52bmddBCg3gcJxuDht5UF1Jtb4
X-Proofpoint-ORIG-GUID: cV1Jyr52bmddBCg3gcJxuDht5UF1Jtb4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120146
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

On 11.12.2024 9:29 AM, Neil Armstrong wrote:
> The Adreno GPU Management Unit (GMU) can also scale the ddr
> bandwidth along the frequency and power domain level, but for
> now we statically fill the bw_table with values from the
> downstream driver.
> 
> Only the first entry is used, which is a disable vote, so we
> currently rely on scaling via the linux interconnect paths.
> 
> Let's dynamically generate the bw_table with the vote values
> previously calculated from the OPPs.
> 
> Those entries will then be used by the GMU when passing the
> appropriate bandwidth level while voting for a gpu frequency.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 48 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 47 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index cb8844ed46b29c4569d05eb7a24f7b27e173190f..995526620d678cd05020315f771213e4a6943bec 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -6,6 +6,7 @@
>  #include <linux/list.h>
>  
>  #include <soc/qcom/cmd-db.h>
> +#include <soc/qcom/tcs.h>
>  
>  #include "a6xx_gmu.h"
>  #include "a6xx_gmu.xml.h"
> @@ -259,6 +260,48 @@ static int a6xx_hfi_send_perf_table(struct a6xx_gmu *gmu)
>  		NULL, 0);
>  }
>  
> +static void a6xx_generate_bw_table(const struct a6xx_info *info, struct a6xx_gmu *gmu,
> +				   struct a6xx_hfi_msg_bw_table *msg)
> +{
> +	unsigned int i, j;
> +
> +	for (i = 0; i < GMU_MAX_BCMS; i++) {
> +		if (!info->bcms[i].name)
> +			break;
> +		msg->ddr_cmds_addrs[i] = cmd_db_read_addr(info->bcms[i].name);
> +	}
> +	msg->ddr_cmds_num = i;
> +
> +	for (i = 0; i < gmu->nr_gpu_bws; ++i)
> +		for (j = 0; j < msg->ddr_cmds_num; j++)
> +			msg->ddr_cmds_data[i][j] = gmu->gpu_ib_votes[i][j];
> +	msg->bw_level_num = gmu->nr_gpu_bws;
> +
> +	/* Compute the wait bitmask with each BCM having the commit bit */
> +	msg->ddr_wait_bitmask = 0;
> +	for (j = 0; j < msg->ddr_cmds_num; j++)
> +		if (msg->ddr_cmds_data[0][j] & BCM_TCS_CMD_COMMIT_MASK)
> +			msg->ddr_wait_bitmask |= BIT(j);
> +
> +	/*
> +	 * These are the CX (CNOC) votes - these are used by the GMU
> +	 * The 'CN0' BCM is used on all targets, and votes are basically
> +	 * 'off' and 'on' states with first bit to enable the path.
> +	 */
> +

/* The CNoC BCM only needs a simple off/on vote pair on all platforms */

> +	msg->cnoc_cmds_addrs[0] = cmd_db_read_addr("CN0");
> +	msg->cnoc_cmds_num = 1;
> +
> +	msg->cnoc_cmds_data[0][0] = BCM_TCS_CMD(true, false, 0, 0);
> +	msg->cnoc_cmds_data[1][0] = BCM_TCS_CMD(true, true, 0, BIT(0));

While it evaluates to the same, I think this is logically 1 (as in, one
unit of bus rate). The question of which bit that corresponds to is
handled by the macro.

Also, a7xx sets values in both x and y parts here, while a6xx only does
so in the y part.

> +
> +	/* Compute the wait bitmask with each BCM having the commit bit */
> +	msg->cnoc_wait_bitmask = 0;
> +	for (j = 0; j < msg->cnoc_cmds_num; j++)
> +		if (msg->cnoc_cmds_data[0][j] & BCM_TCS_CMD_COMMIT_MASK)
> +			msg->cnoc_wait_bitmask |= BIT(j);

This is a very fancy way to say msg->cnoc_wait_bitmask = BIT(0)

Konrad
