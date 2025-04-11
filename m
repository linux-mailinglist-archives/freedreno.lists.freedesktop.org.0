Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F14A85A7A
	for <lists+freedreno@lfdr.de>; Fri, 11 Apr 2025 12:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692C110EB6E;
	Fri, 11 Apr 2025 10:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OJe0pVHC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58FB210EB6D
 for <freedreno@lists.freedesktop.org>; Fri, 11 Apr 2025 10:52:38 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5SCxo029696
 for <freedreno@lists.freedesktop.org>; Fri, 11 Apr 2025 10:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fNXY9rYt/z3Q2Ub2AXLO/VnBcVUjSATOzGNm4ge035I=; b=OJe0pVHCljdmX1ri
 cMA6O69qXk/bF3aoz7rXWnqHVtmj8eAFhoOzLphmmoLv9+p3nltv6Gu9P7KxMS8f
 T42v2gRq1zrf3hFExbI6KpZS/IJTRcE9UMQnetzquTPtcn4IevTj3h93cZzuW0vr
 0Kgx02LMvZPgNkwqvbtuYe6s9mHMqHMejK5C12q9dLkWNFuLHr3mFBosE95zj1IY
 3LNhhKJA+jmgRa1se2w18qU4CuCx5zTyBpCO9G9ErhEQteE/ErZD43UWC1NQRi1s
 FQ41FiP6OnHfuEm9ZoQ5y6X0SJDUNeEZnXjvqD8DICoXIt48s84C3VC73bz9fpTa
 8gQ9NA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbut5ek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 11 Apr 2025 10:52:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c53d5f85c9so39814985a.1
 for <freedreno@lists.freedesktop.org>; Fri, 11 Apr 2025 03:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744368756; x=1744973556;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fNXY9rYt/z3Q2Ub2AXLO/VnBcVUjSATOzGNm4ge035I=;
 b=oeyZ68JCjzblunE187qPA3QEfhrp3MnK+jPj5Dpb0Q6jTjeW2vBlMn9W98wSl8f0AU
 WDAirCbwhQWA90AS0dQuSV/GPn/GW7r+Q3YlSEqXA+cdNUn7byigYBDayQ0xb/osLbDe
 BIi0MICffLWz16t/w+A7Z/+Fmj3AaaPI57AIlo39jBMbfIx1Z/uN0FTJBXYhHazO0VVP
 u/4pggE0CO6Ck4STo0aVsq/7G0EVLmiFRG/jsCBFtI1MF8dKMyF/WBV00n/WgdLH2zVU
 PuKAzaRNc4kxS2D/WEcjIjtEjXQvNXo8Z0v90YHBK09NkneKgmgVMct+Fhh3i+l11Lis
 O4FQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/MOGJuaIMyZ+iUyVRwMUqi4sNVWZVrGQcy/IwtLMYdzbyaBXAhfwgDf3fSL9fKtm0BDBbm0XxHAk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzzo3i/SUkrhJ3v8wmRK9Hkm3n4MON4LBa1Ty3AuoSvwwFIhbiJ
 h5HI6UnAl/nD37qWYwfG8BjHioMxOCJkNQ/5C2ufl6KbF9Ixb95FQ6knTcs7OuutWRXE6t1Zq1K
 OYVpQr9ND9OJdmwya97MG1+Eu2vhAO2w6ch9KE3xZZYEXbjNam2Q3I+u+uIydoEGuE0M=
X-Gm-Gg: ASbGnctbUNA2e9pVFKs/DfxMu+2A+MSooNKNPhd55G2ANApZQ1DxZiC7LNl3+PxcFuo
 icgN7+q7olW1rHgWCo3SnGN6WoClBytf6H0LVSC7EYuQW0JWh34L6cU1WMLooF5LSuZFZcudyZZ
 3V4vPra9YY6MmGeg2fc7OD4PhY+rztByNpQFcsMaU7k5nFdlSZbRhnH8paCCC0nRdyBxp1b5H8x
 EoaomCnHDBZNfdHW6014tpIR8onvJ9P1BhCerGRaMZ+hnPEi9DPdq7wIGUxTdyumztUluSf7CHi
 hwo48nz5rwY1aXuRCFTzZTEgPMEQN2sauP+z5O45RfXf4nBW+ZfIpoDO9Y9wUfvshw==
X-Received: by 2002:a05:620a:c53:b0:7c5:8f40:4d47 with SMTP id
 af79cd13be357-7c7af1dc318mr119453785a.13.1744368756303; 
 Fri, 11 Apr 2025 03:52:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgpMoOoENvwdXllWONxEL3omMfIMcMMELpt2LzrD6jRvrCAkafmMSO9EYpuccU7DXY3huwRQ==
X-Received: by 2002:a05:620a:c53:b0:7c5:8f40:4d47 with SMTP id
 af79cd13be357-7c7af1dc318mr119452585a.13.1744368755845; 
 Fri, 11 Apr 2025 03:52:35 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1ccc2dcsm427286966b.132.2025.04.11.03.52.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Apr 2025 03:52:35 -0700 (PDT)
Message-ID: <4e265348-3466-49fb-82e2-255205052d1e@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 12:52:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Retrieve information about DDR from SMEM
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
 <685e784c-3f36-4cd1-9c34-7f98c64d50f2@oss.qualcomm.com>
 <0bec3e62-0753-4c3d-abe1-1a43356afc80@oss.qualcomm.com>
 <e7bd2840-dd93-40dd-a1bc-4cd606a34b44@oss.qualcomm.com>
 <CAO9ioeUeNeSxz7ADZ-BbJbhEKkszVS+SmbqaZCgTpL=csak=hg@mail.gmail.com>
 <b04464b6-2ad9-4866-88e9-437e96645726@oss.qualcomm.com>
 <sgjporlde6bgcp2mhr3r5c6wj3a3u37s5nlrrokbutsyizixod@7shpt55muqki>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <sgjporlde6bgcp2mhr3r5c6wj3a3u37s5nlrrokbutsyizixod@7shpt55muqki>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IwDJPKTJ1K3cbS-uYgstNBIkRFn-IlOJ
X-Proofpoint-ORIG-GUID: IwDJPKTJ1K3cbS-uYgstNBIkRFn-IlOJ
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f8f475 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=E-cWInRRfnsFT7zTJZEA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 mlxlogscore=460 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504110068
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

On 4/11/25 12:50 PM, Dmitry Baryshkov wrote:
> On Fri, Apr 11, 2025 at 12:03:03PM +0200, Konrad Dybcio wrote:
>> On 4/11/25 11:57 AM, Dmitry Baryshkov wrote:
>>> On Fri, 11 Apr 2025 at 12:49, Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 4/9/25 5:49 PM, Konrad Dybcio wrote:
>>>>> On 4/9/25 5:44 PM, Dmitry Baryshkov wrote:
>>>>>> On 09/04/2025 17:47, Konrad Dybcio wrote:
>>>>>>> SMEM allows the OS to retrieve information about the DDR memory.
>>>>>>> Among that information, is a semi-magic value called 'HBB', or Highest
>>>>>>> Bank address Bit, which multimedia drivers (for hardware like Adreno
>>>>>>> and MDSS) must retrieve in order to program the IP blocks correctly.
>>>>>>>
>>>>>>> This series introduces an API to retrieve that value, uses it in the
>>>>>>> aforementioned programming sequences and exposes available DDR
>>>>>>> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
>>>>>>> information can be exposed in the future, as needed.
>>>>>>
>>>>>> I know that for some platforms HBB differs between GPU and DPU (as it's being programmed currently). Is there a way to check, which values are we going to program:
>>>>>>
>>>>>> - SM6115, SM6350, SM6375 (13 vs 14)
>>>>
>>>> SM6350 has INFO_V3
>>>> SM6375 has INFO_V3_WITH_14_FREQS
>>>
>>> I'm not completely sure what you mean here. I pointed out that these
>>> platforms disagreed upon the HBB value between the DPU/msm_mdss.c and
>>> a6xx_gpu.c.
>>> In some cases (a610/SM6115 and a619/SM6350) that was intentional to
>>> fix screen corruption issues. I don't remember if it was the case for
>>> QCM2290 or not.
>>
>> As I said below, I couldn't get a good answer yet, as the magic value
>> is not provided explicitly and I'll hopefully be able to derive it from
>> the available data
> 
> I see...
> Is this data even supposed to be poked into? The foo_WITH_bar types
> doesn't sound like a very stable API.

Yeah, it was designed with both the producer and consumer being part
of a single codebase, always having the data structures in sync..

Konrad
