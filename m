Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7645CAB194F
	for <lists+freedreno@lfdr.de>; Fri,  9 May 2025 17:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A15310EAA7;
	Fri,  9 May 2025 15:52:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RtiMTzwy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF3F10EA8F
 for <freedreno@lists.freedesktop.org>; Fri,  9 May 2025 15:52:31 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549AT1wI014411
 for <freedreno@lists.freedesktop.org>; Fri, 9 May 2025 15:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 OgpdIMOzRk6f6Ol3Oo2lwgI+bdt0V38jDJzDqsqNV2I=; b=RtiMTzwybNjNSW9c
 hufGWZfhosdUtfaaQQpgabcB9SXAXgjLDCwLxsSwvX2vNoWCHBJpoUPQsndrBofM
 Xkgxc3VJEJI2fKbS01gbsjT1nF+vUg8TR66RfujbvDP1cnAQ1E75gAAIF48wfBA2
 yN9KLaOl+SI4YRLqesP07oxJRzYlHmgN+56B38so4tS79n5UF8/OInK0ZttWCnSl
 uk9Fqn8uVbDYwc9a+sRM0qSNyg55INx2dw+ZRirlA/1YlSHsPTcnJNGaRzfcY6d+
 EXqc/NlBWno0PBEQzkMf6Q9oH+VZa0wtxxmyOtaNanf7cJJ7Db/2fro3BmnCAT2h
 qxWTmQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp4n6r2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 09 May 2025 15:52:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c545ac340aso10788485a.1
 for <freedreno@lists.freedesktop.org>; Fri, 09 May 2025 08:52:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746805950; x=1747410750;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OgpdIMOzRk6f6Ol3Oo2lwgI+bdt0V38jDJzDqsqNV2I=;
 b=F9H+XUpv/4WnsCIe06qp9Fk11g/R8tjgrhm3jJbxWvrb+oKJXybVGWxTFdK0X+zBCE
 z2VWSSV4WkWvTB4EBHEw9b529jcKb1KjBl+SCMx+tYTMMNYOZkgtEIY+dIupQW3aBze8
 NYbRg9GdxVUF+Qs4vxmKrqX86+q8L9w5mutYzTTo1GZUnoSj6WpvoaCfF0Nu6BIXy2zb
 LuFgVCxgMNpM3HhB2R6VQlntSzjh/waTuAG8Ybj5ogjk3OkpNPBzmMCsLUh2LTSSJ/BN
 Fg9GMeMaTr8JAGwfZg3R2xuPDxkBRowHELBadv9aFqo1+50sUnHU+PKLMSU06monWFnx
 IKQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7h0tuzBs8p2e6GefS7ti56gKpunatpm6bn7IX6o91uRbbYp5nXHDiL0VzgbEkm8+vcCsJQ+NeLWM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCy3AdbTWdH9n7XN+KFwgGluWLwI9gdFENWSrDwpFeE2aFcdzG
 dPGcrDDU5uHi4+9L38PihaWn5emiiuOzA8dvsuLYe4tLToGBYMF9BFnPInX49xZsjsINGjJFF7r
 wjAma1vBtIeEvoV0a46SujJHGbJANzN02JKb+1j1neZVXSz+Qqlvc/VMUWlgDdn8hQN8=
X-Gm-Gg: ASbGnct0RsHOZzWWlQ5TYbHMa05Io3p8sgXAKH+N8mGq1ARGGAsERjZpl6r0ttiu1NR
 4DDkqldvR6VzVvi1w1ZMVcMWjqQXo27FgUFDKjYOd81FNrpGDArwlkpKqlpaUKSwEtCi0vtNO9K
 Ng1K9hrf5297et9yKg7oqeNuNM9BIQXp/Pf+AR3KnT/FnpxdyrvTNq/DZfngzcoHjYWdgzXdpD7
 7vtbK+F2C4PNj6bNhhw14yg0VXFNodATLO9qFr9wyNG51m9ze9DloAXvo3c5l+v/51mORXl8JNG
 MRQy4ZYaI4PxRrZ+8xoyvJB8wP6FpoScSa1HRVoWNJkGTRrtui8yisxJ6NOdlgGbT3k=
X-Received: by 2002:a05:620a:290b:b0:7c5:e283:7d0f with SMTP id
 af79cd13be357-7cd01108cb6mr239887685a.8.1746805949860; 
 Fri, 09 May 2025 08:52:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6vSB51mdOZghOfvmG4yP63LfVUtSo1UHFOlSG6Oe5suFemWAMe5tcTQ95NoXx3vY6htX1hw==
X-Received: by 2002:a05:620a:290b:b0:7c5:e283:7d0f with SMTP id
 af79cd13be357-7cd01108cb6mr239885385a.8.1746805949419; 
 Fri, 09 May 2025 08:52:29 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197bd37dsm166816666b.124.2025.05.09.08.52.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 08:52:28 -0700 (PDT)
Message-ID: <9010219f-a3f1-4869-84b3-b4f6c5e9f05f@oss.qualcomm.com>
Date: Fri, 9 May 2025 17:52:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 13/14] drm/msm/a6xx: Drop cfg->ubwc_swizzle override
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-13-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7E9yU-cygZxBqVypP7aFkXJCNTfXA2uqdvU84mi9T51Xg@mail.gmail.com>
 <5f5e512c-ae0e-43aa-856f-06820ac4b147@oss.qualcomm.com>
 <dedbfb2f-012a-404f-87d1-2f3cd04b0e74@oss.qualcomm.com>
 <CACu1E7EfgPFcSgGA5TkAVqpO=K2G1AjNVbRij60TknCx5PcoqA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7EfgPFcSgGA5TkAVqpO=K2G1AjNVbRij60TknCx5PcoqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jXguiP471gUuq869ee41Auafxq9xpMDi
X-Authority-Analysis: v=2.4 cv=E5XNpbdl c=1 sm=1 tr=0 ts=681e24be cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=0-j0KOu8P3_yQaFSRvsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDE1NiBTYWx0ZWRfX/3/QWX1EkRk9
 BQ7b1wYg4JE3CW0tQ2GJQDCum2eOtOB0quGWdcVRl1wwmL1LWLaqjbB2HGsX8AwO4gA8MnZLW8U
 Fh1RLH1ZX1Y0LywQ5gYXp7cP2Cb0Pp87jFriRXdo+PdmOzSBCBhhGdIG1NB1JRSLNS8uWZBEYPq
 7DUhnQA8L+rf6dmhtUEgz/G1U57sxxqxkUnwI+woTnLLRYTZPqx0yRb3ukIAvGi/VzDuFVSo5bN
 Pw4KVGBPlTwlc2XxrSpXQsFN0FyAQFv5bkAzFCduWaxSHhhUoEu79Z4lcNNLY4a3slJyXATLFX4
 Sou5ngVaqsBiEiPpScwgiQ7phjPkYpnNBfFHcxZatXo7P8zGa8KCA++ZfeL16F/8AW8HJhphkmE
 OZHQnwyFbNAmuitU507ZHvyBN0WIZQieBlc38OsRV5D80fElto2U2xc/BY7a+yWd2yS5awqK
X-Proofpoint-ORIG-GUID: jXguiP471gUuq869ee41Auafxq9xpMDi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090156
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

On 5/9/25 4:48 PM, Connor Abbott wrote:
> On Fri, May 9, 2025 at 9:37 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 5/9/25 3:17 PM, Konrad Dybcio wrote:
>>> On 5/8/25 9:26 PM, Connor Abbott wrote:
>>>> On Thu, May 8, 2025 at 2:14 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>>>>
>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>
>>>>> On A663 (SA8775P) the value matches exactly.
>>>>>
>>>>> On A610, the value matches on SM6115, but is different on SM6125. That
>>>>> turns out not to be a problem, as the bits that differ aren't even
>>>>> interpreted.
>>>>
>>>> This is definitely going to break userspace, because the kernel
>>>> doesn't expose the UBWC version, instead exposing just the swizzle and
>>>> userspace expects that it sets the right value for older UBWC versions
>>>> before it became configurable (0x7 for UBWC 1.0 and 0x6 for 2.0-3.0).
>>>> It looks like the data for SM6125 is just wrong.
>>>
>>> Oh that's sad.. I'll drop this commit
>>
>> Wait uh, we have this data in the common config.. why would it break
>> userspace?
>>
>> Konrad
> 
> As you said in the commit message SM6125 has ubwc_swizzle = 1 which
> seems wrong to me (it should be 7), it just didn't matter before that
> it was wrong. You should probably just fix that.

Oh so you meant that the 6125's value would break userspace - gotcha

Konrad
