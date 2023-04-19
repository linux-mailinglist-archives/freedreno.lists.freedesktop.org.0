Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C696E817A
	for <lists+freedreno@lfdr.de>; Wed, 19 Apr 2023 20:50:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38CA310EA8F;
	Wed, 19 Apr 2023 18:50:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B22C10EA8F
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 18:50:50 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33JHr9Pk000307
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 18:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=91zHhHkbua2FjUua4gnUlJnCiWZApyKXr8RmF7J8f8Y=;
 b=VpIf5GEuVplVMu1+U1O5b24Fa3Tu8ux901hy3P0OepTLNR4TLWzpv/1y17/UwlG3oN2U
 zkT/MWHAllYO/jQVaO0g6oLca7JhSqFg8ilik34fJ8e6UC4RT3H5BWSb6QDjiBGY5lCV
 TV96jW40/mpHb4nL8C/gUDvorJe+j55O4VlIr3h1nEmNo2XkpZab4c+aRwNtcn4WvNcz
 NCROrE55/8Dfv1X+aGaj8TjRJavZ6MzP7vsqFDB+AwPBJ5zI60zXHpSgvh+1Teor6Kmf
 0gN7gyn20R1m2lmb4HZARtd0h66Bvfw+k96vsidnEUhX7rIUrJimZpGSdEuOdqLe7F25 tg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q2bqrspqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 18:50:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33JIolKl011225
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 19 Apr 2023 18:50:47 GMT
Received: from [10.134.71.70] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 19 Apr
 2023 11:50:47 -0700
Message-ID: <1c9ee3ec-2e69-9782-81e3-e9835c4bf7ef@quicinc.com>
Date: Wed, 19 Apr 2023 11:50:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: <freedreno@lists.freedesktop.org>
References: <20230417-topic-dpu_regbus-v1-0-06fbdc1643c0@linaro.org>
Content-Language: en-US
From: Jeykumar Sankaran <quic_jeykumar@quicinc.com>
In-Reply-To: <20230417-topic-dpu_regbus-v1-0-06fbdc1643c0@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: svVLSlcGkpxezAiX1YXDvGe7inbzl36l
X-Proofpoint-GUID: svVLSlcGkpxezAiX1YXDvGe7inbzl36l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-19_12,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 bulkscore=0 malwarescore=0 clxscore=1011 mlxscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304190164
Subject: Re: [Freedreno] [PATCH 0/5] MDSS reg bus interconnect
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



On 4/17/2023 8:30 AM, Konrad Dybcio wrote:
> Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
> another path that needs to be handled to ensure MDSS functions properly,
> namely the "reg bus", a.k.a the CPU-MDSS interconnect.
> 
> Gating that path may have a variety of effects.. from none to otherwise
> inexplicable DSI timeouts..
> 
Current DPU driver already votes on the "reg bus" indirectly through the 
display AHB clock handle[<&dispcc DISP_CC_MDSS_AHB_CLK>] in DTSI. Can 
you provide more details on the issues that warrants this patch series?

> This series tries to address the lack of that.
> 
> Example path:
> 
> interconnects = <&bimc MASTER_AMPSS_M0 0 &config_noc SLAVE_DISPLAY_CFG 0>;
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Konrad Dybcio (5):
>        dt-bindings: display/msm: Add reg bus interconnect
>        drm/msm/dpu1: Rename path references to mdp_path
>        drm/msm/mdss: Rename path references to mdp_path
>        drm/msm/mdss: Handle the reg bus ICC path
>        drm/msm/dpu1: Handle the reg bus ICC path
> 
>   .../bindings/display/msm/mdss-common.yaml          |  1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      | 10 +++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 34 ++++++++++++++++-----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |  5 ++--
>   drivers/gpu/drm/msm/msm_mdss.c                     | 35 ++++++++++++++--------
>   5 files changed, 57 insertions(+), 28 deletions(-)
> ---
> base-commit: d3f2cd24819158bb70701c3549e586f9df9cee67
> change-id: 20230417-topic-dpu_regbus-abc94a770952
> 
> Best regards,
