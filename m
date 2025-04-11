Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2FAA85852
	for <lists+freedreno@lfdr.de>; Fri, 11 Apr 2025 11:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D0CA10EB4B;
	Fri, 11 Apr 2025 09:49:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="moQeEa2I";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EAC910E03E
 for <freedreno@lists.freedesktop.org>; Fri, 11 Apr 2025 09:49:01 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B6S3qv000323
 for <freedreno@lists.freedesktop.org>; Fri, 11 Apr 2025 09:49:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1Cs7Olcf+iGn0kiLuKLVzTGFucVizSpTxlSXymspVxU=; b=moQeEa2ISOojle/w
 /JoZ35u9aMiF2+p6HCZg34oGywaDgM3UO6AYsquLopCnm2ii7ww9VjjFFP+6ILWf
 1yWC6q24vXnxgxjQ1HdvUSFoWoMniTAKXLQenjw3n+7B179Zujl5ABxIQyNZBvHb
 FKsuGrlN+HAxQlaw9WhDATIC8yFlE1WrvzrFhOIxeJPBFk1+N7b/Hh0Tx7XroHrt
 SzmGACtbeVq9MutycP4bCOvwBrAn6juwgncxGlsrsd8v1kw8I9zFRB1wfSPpFPXM
 vnrVnTPxtVCU7Y2iXQ2nubr2mOfGdAswvuYdVe6buWL2r7RW3LegenEu7yxad+sW
 5DrE+g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfksrx5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 11 Apr 2025 09:49:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c53d5f85c9so38758785a.1
 for <freedreno@lists.freedesktop.org>; Fri, 11 Apr 2025 02:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744364940; x=1744969740;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1Cs7Olcf+iGn0kiLuKLVzTGFucVizSpTxlSXymspVxU=;
 b=SVsyVMPZaFC0g3yWSSsIycU7nFs4vST6nB2ri92NpIY/y8JMAPkDNEakK94wBoV1jg
 qkM+ICz678zcGKymODNCXk2QDxncPaRYBqPrYsYeCxmR8oRLAEpA4QMvveRT1vhFWhfX
 q5cUsElRNRSNRTpvMOkNjRw1HEeaD6FJFXC1Fri1BZYe8cFovvnhK3RkS9o5mrapBfk8
 edi9Mjn/7xjtp64QjWRm42GzKT+OwLSXv7vqdt2IaPs6RNHdX02sEoyDsLY7HXPAc+lg
 KreKJIhnLhBwJsGkxE1nyxtAM+Hp0UGjeVD+BrWdAiWhUGv06CW3qObycRIqr1qjhWtO
 d9Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3YXPx6LD2fjBsX0U/fEDY4ngGyRjK72C2O4TLUaOnBOwPFMsDJv89bu/FcDqU10N1OoX5cLZffAg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2rhjNG7ywN8RiOs1ueEekxqu7DDvSEbuefHkBS7CQ+klyvsV+
 /wyRqdkIrvvEF4g6PBBqZHfEpDLGRP1z/3GUXAVreSg+yK2Jf7gW8g65lKU3+br7HlPd3t2rRE7
 UBc18RtUOLHTktIfUvxN6LpgVxkTKqxXe7LBJlRNbJ8Ne9vKYoDSuaHKCehPwU/pxdUg=
X-Gm-Gg: ASbGncuAXlSNh5PL/amlkyGzwH7qhIlCTgK/Yc5LBJ6vfDChbcuksbE/TQSt4DbMmRn
 oXuL6t4bZ2JWl5b+whOHWI1w0kn1DqXyNCQfja7yBqYtQocG/YLizD3kChZ7gUjm0l3HkZRsyb/
 4HjTl3QlVSxXs70VN2KLHfvJi66ztBgJOGYJRjhMZcJalIQyyM5ZVbhCRRqvc9adDYSdkIQk/vC
 GbWf8Z0FvsGb5HguqvsLCgHAmoAe3M+Y1BqYmxiL3NOc/UTsxZgytJUr4Mlc1B4yPvAl0crlP6r
 5wsFXFWiMTp3WdzX/ZF+GAqsAdbTsavI6iyXv1dh1dlaSgR5TyoeQsDIN1GWq4OCBA==
X-Received: by 2002:a05:620a:254d:b0:7c3:e1ef:e44d with SMTP id
 af79cd13be357-7c7af04c112mr120742185a.0.1744364939718; 
 Fri, 11 Apr 2025 02:48:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9uldhSMjj77tDXI8Od9HS0eE+YcyHVF3EP8I1eSD53hf5eI36oThMUSZZTFoT4LlFjZitIQ==
X-Received: by 2002:a05:620a:254d:b0:7c3:e1ef:e44d with SMTP id
 af79cd13be357-7c7af04c112mr120739985a.0.1744364939225; 
 Fri, 11 Apr 2025 02:48:59 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1cb4204sm415022866b.116.2025.04.11.02.48.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Apr 2025 02:48:58 -0700 (PDT)
Message-ID: <e7bd2840-dd93-40dd-a1bc-4cd606a34b44@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 11:48:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Retrieve information about DDR from SMEM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
 <685e784c-3f36-4cd1-9c34-7f98c64d50f2@oss.qualcomm.com>
 <0bec3e62-0753-4c3d-abe1-1a43356afc80@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0bec3e62-0753-4c3d-abe1-1a43356afc80@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vSS3POtwL6RuW1D13ayW5MgOWHmqarVW
X-Proofpoint-ORIG-GUID: vSS3POtwL6RuW1D13ayW5MgOWHmqarVW
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f8e58c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=ur0lq8UJKF3ET7YIcuwA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=825 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110060
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

On 4/9/25 5:49 PM, Konrad Dybcio wrote:
> On 4/9/25 5:44 PM, Dmitry Baryshkov wrote:
>> On 09/04/2025 17:47, Konrad Dybcio wrote:
>>> SMEM allows the OS to retrieve information about the DDR memory.
>>> Among that information, is a semi-magic value called 'HBB', or Highest
>>> Bank address Bit, which multimedia drivers (for hardware like Adreno
>>> and MDSS) must retrieve in order to program the IP blocks correctly.
>>>
>>> This series introduces an API to retrieve that value, uses it in the
>>> aforementioned programming sequences and exposes available DDR
>>> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
>>> information can be exposed in the future, as needed.
>>
>> I know that for some platforms HBB differs between GPU and DPU (as it's being programmed currently). Is there a way to check, which values are we going to program:
>>
>> - SM6115, SM6350, SM6375 (13 vs 14)

SM6350 has INFO_V3
SM6375 has INFO_V3_WITH_14_FREQS

>> - SC8180X (15 vs 16)

So I overlooked the fact that DDR info v3 (e.g. on 8180) doesn't provide
the HBB value.. Need to add some more sanity checks there.

Maybe I can think up some fallback logic based on the DDR type reported.

>> - QCM2290 (14 vs 15)

I don't have one on hand, could you please give it a go on your RB1?
I would assume both it and SM6115 also provide v3 though..

Konrad
