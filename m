Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 750B7D1D983
	for <lists+freedreno@lfdr.de>; Wed, 14 Jan 2026 10:38:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52BB410E5E2;
	Wed, 14 Jan 2026 09:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZIR3aNnG";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OtkWwGXU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0180F10E5E2
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 09:37:59 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60E7jOJW148005
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 09:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RhhbnWDSKAq3cY01bhquUpPCOlQ2BxpDupyc8QFMtqM=; b=ZIR3aNnGGldnQyYj
 UhaMs10N5GTIacsoOSvFIWOeLuRRwZ5lobaveKIaeJqCzbLnTbjlFbEnlU2937KW
 0YqvSPUNXI9VDRqIFskq+hODjYuz/Pg79uq6nLJae8XoAxJmyBo84agJAN+fZSEv
 Jg4J27UNoujc8JxEC0JkAOnJXhnBqMnXG5sGh0khnD5AUy6AEAnXFSJBpjJqpNxH
 IE8I5ccvOt4NcHW7BNECeGDM9cUwz8PEEKi6QL/X7ypTLNF6fVQNDpe1B72KbrQG
 ZDTojSWdrqhF3TEmt2bw/W+4FQb47Bm8usqHOPq/sWjccDAxe0Nvwx+LaqrHU0Xm
 U3uedQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp6ragfe5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 09:37:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-50146e00a23so2678041cf.2
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 01:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768383478; x=1768988278;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RhhbnWDSKAq3cY01bhquUpPCOlQ2BxpDupyc8QFMtqM=;
 b=OtkWwGXUIuh8f1fJh/nRgVUU21udlWsSe5dQ0dR/8yfe3Tvjo0H/UZpruCcp4tj5TF
 9L5RwuvEe550MQVklNTtjIPOc2LxfReD/YPggX1ZVEZTC9gvmffOYvRIowcyGTYwGHTp
 g/WmE93xX0Z23tZQcc7MbtE2t77eOrrd74x51CqJX6l4Xez+E999aK58e6knxYZagJxr
 xTU40z64RiSaSqTJRuTjh21VRKRTUaoaTuDqjXhnll/gOS4Np/M1TIJmwAR1giCK98id
 ih50GBAcIKuIDXbkPGes3aNjc33R3JNO63w39jjgPYH3KT9DNX9KxhVKAahbnDRrRHmv
 +1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768383478; x=1768988278;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RhhbnWDSKAq3cY01bhquUpPCOlQ2BxpDupyc8QFMtqM=;
 b=q+hsONb1nRo+sT34xTP8Jjekq2N+Uvd9HSSj5HEdRZLGrjAjzSeTKKaUHZy0I8SeyZ
 o0YgG3TIjIYO4+yYPBpe7mGCShMzecKbAUBeXsSntTSnmPzPNJAHkDRvkSrMeL4vDJCX
 5u2GviIC2Ji923uUitIfzUGMIFlERakhhtiipjwtD9s6e2xOLYmVxp4iHwkIe1e0xe+9
 zuJDHAUqotdglwLhw3t54wf6uY4F6CBiz1khvlJyJXxf58S/+LLkxyEFXWgFjMKbgmnL
 g7/ukAkjB69yRugN18fLPOrUxnfZOESDp3MH0LPvXBGP0N//ywAnxeb4p/ksNTZi1YDc
 65jQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXCmhNTrlBpuLQdoc4oT0/BSRAS42guSIaBUV/ju61j0jVorgQzaaafA0NDFYkYmLkhay8oag04YQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOcJJdZ1Rz1+RcHl81p68EDAfa0kxGW+0JD61ZUQiOytMJPHIp
 T9k9N797JhJjY54CpXgEffTbydyxqLI5Cw/t+fMgMic0/PjHkKT7fgXKVwq8UdBmbd9Kp4swrff
 IIh0Yh4abJ4lFy0Kf4+h7tQ1aqlyA1KFWwlZ6fIuDFlPYG2c6KmgV0hDX7WE5/qtu303YTjA=
X-Gm-Gg: AY/fxX7nlSgQ9cib58NjTFajAUdk1JSX6OnoQ3nFKfMq/tszXJcni1plId45nc2wS7P
 B/VgMpqZbajNUGpDK9vpmyI+dp7gBjEj1K6NNOB8GXNghKuQhAgZxheVtc5/D+jepSIODWtGQSh
 F5RIesrQ5e32KXmg5fbw6X/ktZB4GV7GtP3ZbDAlhmXNXR5704v16N5NeXjZVhJSssCJ1fsrIz1
 +I45mioN3IJoe0CGGmGFzIJmYwhqEKa3a9ElL9QG/SnzIGmcrI2T2XcoU0AtBQ8Q/r7/7gWhxuC
 fzmRRPFJte0GXPFxSBR4/2vH/BoAcJ8WCYm4DfuGyochL8n4lgensBkoU+Rr942aTw1dbB7gpfI
 4R593QWVCoLF+O2o1ypgy6ITMWK3upp2ViO3LFkwof8n+y+/HowmzRW4a9Z6Z6DUlOPY=
X-Received: by 2002:ac8:7d85:0:b0:4ff:b754:3a52 with SMTP id
 d75a77b69052e-5014816e52emr21627261cf.0.1768383478308; 
 Wed, 14 Jan 2026 01:37:58 -0800 (PST)
X-Received: by 2002:ac8:7d85:0:b0:4ff:b754:3a52 with SMTP id
 d75a77b69052e-5014816e52emr21626971cf.0.1768383477873; 
 Wed, 14 Jan 2026 01:37:57 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507b8c3f89sm22240499a12.5.2026.01.14.01.37.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 01:37:57 -0800 (PST)
Message-ID: <44d2ba08-e760-4f7d-bd87-6ef3a5415ebb@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 10:37:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] soc: qcom: ubwc: add helper to get min_acc length
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
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
 <20260113-iris-ubwc-v2-2-4346a6ef07a9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-2-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA3OCBTYWx0ZWRfX7kFJF7kQd9or
 5EIENJltnpNtGhsfb0gFs8rLUKudsKn2f65gQ5S+k6UzDZCsIWoeeik0z05N0O4D17phvJcZ7Oy
 MzN5JXhE0VSK06IUU4hugntzxwG/e8SoMyEY1bdsOPV0YPj8mdeNLI6H4XB+CldwZ2d0Jez2ttT
 NjdkYrxryDgArDXtze3gPi0ZIx9vTORX5gHh3v+MnB6Ax5EWGyg6oy4LtsxzR/Bh+tu30F4d4eE
 OFCsK1WFZrD9zqYFTNzIrNNyvWEcPXhRlwWSf94KoOeHdZYwmh9pDWzF8Utguaq3kOzeTC2tGRg
 iUlJ/12sasvA/YTFscNYan4Ja9FwvzsCe3qNCm5uha24MR4ecUi/01tFI+wBFe5bcnNP5hdDH7l
 I8G/EspCy8pWJS63pEx1TajDmX2DWzHGQyM5fn1L+OgVSV16zrlto9y15Tj1H/4pmpQL9bWXE4U
 dxamrL3ozQSb6skbBPg==
X-Proofpoint-GUID: bhbs1QHMic2OkRIPmx51oiIzgQ2a9PFA
X-Proofpoint-ORIG-GUID: bhbs1QHMic2OkRIPmx51oiIzgQ2a9PFA
X-Authority-Analysis: v=2.4 cv=L/EQguT8 c=1 sm=1 tr=0 ts=696763f7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=4J1ihs_Kgnsqm2W37X4A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140078
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

On 1/13/26 5:57 PM, Dmitry Baryshkov wrote:
> MDSS and GPU drivers use different approaches to get min_acc length.
> Add helper function that can be used by all the drivers.
> 
> The helper reflects our current best guess, it blindly copies the
> approach adopted by the MDSS drivers and it matches current values
> selected by the GPU driver.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

