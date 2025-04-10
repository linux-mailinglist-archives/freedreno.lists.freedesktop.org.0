Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C3AA84D7A
	for <lists+freedreno@lfdr.de>; Thu, 10 Apr 2025 21:49:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17FE810EA71;
	Thu, 10 Apr 2025 19:49:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZpC/npS2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F9D10EA85
 for <freedreno@lists.freedesktop.org>; Thu, 10 Apr 2025 19:49:39 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AGO3vx031905
 for <freedreno@lists.freedesktop.org>; Thu, 10 Apr 2025 19:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=aNhuwxgEqLQlGdQ0sOZNsXWl
 JqoDDoZqwpr4m2bgAv8=; b=ZpC/npS2kfZgcSJsiieah2iW9S2n+3kFAJli3xUZ
 whp5TGslpUiPVsr4vIPkzojf5GmDVamfBFj3b/bnJPSF3DRtwYckKtsl4ZLMSs+b
 jHLQx8rl+XchJtVaBA0gw5NEptWFXndkXcWSeggoGmpWBKLG022/bqS2deXhiRGN
 z2v6m1Vl8ape1N5ibjcx4H5W4llmhrqbXbPL1JD9uFTgpEZwfXStfBeN2+fIBPJd
 SnLMj+oXQSQMdRNEx1BnQ3S0rDL6g2DB+0cQSwlNAFf/gd3UGYg8yLwC+ACv8kEt
 NGeJEc26PIAVNF/63o2zoUWkIAJEST1sOkqGIvyXb5KSVA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmg38t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 10 Apr 2025 19:49:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5cd0f8961so262546485a.1
 for <freedreno@lists.freedesktop.org>; Thu, 10 Apr 2025 12:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744314578; x=1744919378;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aNhuwxgEqLQlGdQ0sOZNsXWlJqoDDoZqwpr4m2bgAv8=;
 b=srzoAMfYpnzCQmwPnzVCWKW/U+dPHaPss5B3URVy+Y03Ywyk2VreQEI0PsYT303+G+
 /4rj7pXaZk7MRBntiWX1smD3vVn4SVjy89+uV3GpNG29Q+J5FIFkklVeYlBq7NlWF62Z
 xTCcBJ6evRW6sB4u5Qk1wFkuey+Q7LGA8mBWlGMr5vOOsd4sqVr6RR+8Qv6W8qiZ2yvF
 9jfYBpNLK17tq9C1PkrQ1mvQ6amkVZs1GXoDWmWl4N3FQoRqI99CCYqwyqdH+PlBksj4
 ymEXeCuKhEPX6cGmrQ+OcHDz+rvZJ0nQgct2qxeA39Jqgo/+tN6oRFFTfYb60+DtktO7
 mpeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNFv7bH0LPZOxRExHV8xxdK5IzP7jYcSZxheV6D/wUgWCGMIomBNWe2XJKsXrvgsx9LeUiGTh8XHc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzzf42G5mW8ibgQ3fV1dlOH6ulkhqEJNw0VjnuAKPVbAqv1qI/v
 4nvrFxH2cEqD9qY0qB1VUDWd2qY+FjQQGGhPaVLs8ZrOtzi+JjvjqO8taFkw1ZsNbkr/R/4Tkn6
 3qiS6Mx607X9+BZJxXnrx0xPDgBqWWSCRhq74MUlzkSRER+KfAVnBmGB4GBvLfW3kF0o=
X-Gm-Gg: ASbGncsQXysYmG8l2ac9WkbX+lJWAxh8pswg/6WXcA2KeWfsdeHz8X0OPum0NUzBeUY
 NrNDq5/hSHnvZY2DAu5pvY31YOMvRCF7Q7gOMhtTm3NFF8+XqJg3K2Hh/DFwbrwQcx1vmycqmKE
 PliC0Aifc4W5GSUsXorKExyq+4HkRJxoe2LItVNPUspKkr8yuwZkdB+HejJz1rcXuQJ2cdcCbqN
 3nlgR12o9DlK6oeUpboqihVYZ4gQ1Xhx6iZchw8I9k/5n5LMmbQsj+ujbKr2CDjm1oiR07Uxp1P
 tzFufEzOIH+VVllOo6O+VQIas5uS6v1TpHFoX0bkGyilRcAZ1GTx11/d3T3lvOMD7cHp3odC7CM
 =
X-Received: by 2002:a05:620a:2941:b0:7c5:4711:dc51 with SMTP id
 af79cd13be357-7c7af0f8841mr36837085a.2.1744314577842; 
 Thu, 10 Apr 2025 12:49:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsp+mbswefuSskvfP4MGPlMZhuL5PnvXrRuwIIXDia3tt/3yJFdDa3tlw5fgy10G42iTdrsg==
X-Received: by 2002:a05:620a:2941:b0:7c5:4711:dc51 with SMTP id
 af79cd13be357-7c7af0f8841mr36833885a.2.1744314577477; 
 Thu, 10 Apr 2025 12:49:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f4649d86esm5793871fa.14.2025.04.10.12.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 12:49:36 -0700 (PDT)
Date: Thu, 10 Apr 2025 22:49:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/4] Retrieve information about DDR from SMEM
Message-ID: <iebl74rolk2t6xyoedy5p2e7clssh4dvxtpzerykyivrhkao4g@dbmnpia3xtxv>
References: <20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410-topic-smem_dramc-v2-0-dead15264714@oss.qualcomm.com>
X-Proofpoint-GUID: 3jfMHjNujL2-75LGkTlR2hT6gsgjeHY3
X-Proofpoint-ORIG-GUID: 3jfMHjNujL2-75LGkTlR2hT6gsgjeHY3
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f820d3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OxrDjszf_QBMMd4ylzMA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=796 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100143
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

On Thu, Apr 10, 2025 at 07:43:43PM +0200, Konrad Dybcio wrote:
> SMEM allows the OS to retrieve information about the DDR memory.
> Among that information, is a semi-magic value called 'HBB', or Highest
> Bank address Bit, which multimedia drivers (for hardware like Adreno
> and MDSS) must retrieve in order to program the IP blocks correctly.
> 
> This series introduces an API to retrieve that value, uses it in the
> aforementioned programming sequences and exposes available DDR
> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
> information can be exposed in the future, as needed.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Changes in v2:
> - Avoid checking for < 0 on unsigned types
> - Overwrite Adreno UBWC data to keep the data shared with userspace
>   coherent with what's programmed into the hardware
> - Call get_hbb() in msm_mdss_enable() instead of all UBWC setup
>   branches separately
> - Pick up Bjorn's rb on patch 1
> - Link to v1: https://lore.kernel.org/r/20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com
> 
> ---
> Konrad Dybcio (4):
>       soc: qcom: Expose DDR data from SMEM
>       drm/msm/a5xx: Get HBB dynamically, if available
>       drm/msm/a6xx: Get HBB dynamically, if available
>       drm/msm/mdss: Get HBB dynamically, if available
> 
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c |  12 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  15 +-
>  drivers/gpu/drm/msm/msm_mdss.c        |  30 ++--

This misses the dpu_hw_sspp.c, which uses ubwc_config from msm_mdss.c
(but the config isn't being updated with the acquired HBB value).

I'd suggest behaving it slightly differntly: can we please have a helper
module (in drivers/soc/qcom) which would return UBWC configuration data.
We can start with HBB values, migrating the rest of UBWC-related flags
one by one.

Also, were you able to solve the issue of the platforms where GPU and
MDSS disagreed upon HBB data?

>  drivers/soc/qcom/Makefile             |   3 +-
>  drivers/soc/qcom/smem.c               |  14 +-
>  drivers/soc/qcom/smem.h               |   9 ++
>  drivers/soc/qcom/smem_dramc.c         | 287 ++++++++++++++++++++++++++++++++++
>  include/linux/soc/qcom/smem.h         |   4 +
>  8 files changed, 360 insertions(+), 14 deletions(-)
> ---
> base-commit: 46086739de22d72319e37c37a134d32db52e1c5c
> change-id: 20250409-topic-smem_dramc-6467187ac865
> 
> Best regards,
> -- 
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
