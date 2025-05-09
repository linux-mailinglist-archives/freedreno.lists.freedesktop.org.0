Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB2AAB1364
	for <lists+freedreno@lfdr.de>; Fri,  9 May 2025 14:30:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14CF10EA2F;
	Fri,  9 May 2025 12:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zl0GjNo/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 491DC10EA2E
 for <freedreno@lists.freedesktop.org>; Fri,  9 May 2025 12:30:29 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549C6jD7002323
 for <freedreno@lists.freedesktop.org>; Fri, 9 May 2025 12:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 l84llEd8JLKaBllMEadN67nos+6Z843mYuJwRmu5tnQ=; b=Zl0GjNo/+5WV7EPn
 4aLty6QN0B4QEZiS1wOy5GR45AjjQMZxk+XfpKka+PdyTX0/EviO9M8R5oYCiW7e
 8i0LgoFSEtmSH+CfuSgbPYTBq2Ay9EryCfHLsqYD1OZUwBwlaE5wwIwCjcxWbg8R
 9QTdoFgzdQqwX0qRFKXYowco9/paEOSGPnSZUdxWx2oXzY05p0Reb2Tt3nMvTz0q
 chqbAzz3oauv5l7FJnd+DPClKz6vVWAuHkEdoDxT7I6duu1heMOow0xno0BJ6rcb
 4WQG8MQ964LhxdBktcwHjCT5A50M2lbnH4jge0FUJYGc0Em2WZ86f2iyaLc75SK0
 oaz/7w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp5ckwq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 09 May 2025 12:30:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c76062c513so55378885a.3
 for <freedreno@lists.freedesktop.org>; Fri, 09 May 2025 05:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746793827; x=1747398627;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l84llEd8JLKaBllMEadN67nos+6Z843mYuJwRmu5tnQ=;
 b=Dk5Ky8Lix+DrXHlUahVxLD8WpeilhsGoyzXQ5wGr/S0u2MlIf/K0NqIoV9Qo9/zGz2
 K3DI9ZztxXQLU1ITZCtDgzd31ikNPYgwLzauMq/sqTafXm/JeVFVIvBiLev0FkJ3AqjM
 n7cNHC1SNqEf6D/oCk0ayDekkXdCDMnTANEBr31fFdxQ4j6WZstjW8Z8WGLXc9RM0exm
 x7FK1O2dllk8pzOaHZdpdGCNSkkL7t5z2CR4bKPZt//2Ab2ubf9jsIXRZ3Sw/TVzjN5o
 be5RCLA3IwfIThqcMmg/sk9EpG+jQxtXlKiKjs8ijXAkDQb/oMWdnNk8bicEgOtm5XcG
 U0xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyao+FVLRUec0syGfVBiy4WkZMkzx1IsGTHB/BNYRSl2/7ts8rIVRO5EQX1PccdG4y6T3ltiGAt6w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJLW24yseMbgPAwRlHd5fBy9OYBVW3ynabrqc/4GQIq/k2iyEd
 c1t6RWeKnGIBD9JpfNeKEXFlrG+DhjVSf+sSxN7VD2dgRt0yEXp5h/6l/Hrc8Etrn5SnRG1i53p
 oeqdv3s1d0OfMx2wwBQrjaxfvTUQVPaRfj77qESkrkYPOBV9W9P0L0YYrQLlNcHUFqkE=
X-Gm-Gg: ASbGncuQ0Pbme4qWH4gM+xtj6cH7notyQUG+X0ZWo8mSdTFxok2IQPLp0w7dOwtGgKy
 C4itZGju81YrkfKYLhBiaPeaAM06uNS8BZUJoPiTsuv2LtCNmlHYpGbaPMoLOWGGYABFRHsbS/C
 ILJ++xD4rL4CO0VPuxWcqHVPmWaycubuil7tR3VhxMV8EBXe5GZc5d+VNbGMkJpIkAoWSdX2Yrv
 /hz8ewQQTerCN2iE9P5PXAvYK/Qdi+se6nfKLij5dzxcNucLt8S0ngU4XFfKPrD7iqNyHgDA7/T
 vEOmt2Ph8coplxPOx0qjVTA2cGBVU4Agy2+8AGjkVMPJNUSnrwm05+dWMSbHTDl8g+0=
X-Received: by 2002:a05:6214:5197:b0:6e4:4034:5ae8 with SMTP id
 6a1803df08f44-6f6e47bc895mr17282386d6.5.1746793827344; 
 Fri, 09 May 2025 05:30:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbU6gmI8KLHNG4ho2OY5Av6zEE6Kq1HFOv+DgFV16MqINqCdZXRWO8sLBv9ZYej736PGPshg==
X-Received: by 2002:a05:6214:5197:b0:6e4:4034:5ae8 with SMTP id
 6a1803df08f44-6f6e47bc895mr17281956d6.5.1746793826703; 
 Fri, 09 May 2025 05:30:26 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9cc4f240sm1317373a12.33.2025.05.09.05.30.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 05:30:25 -0700 (PDT)
Message-ID: <eddc2ea5-dab7-4c9c-89fd-23ed20b85ecc@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:30:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 03/14] drm/msm/adreno: Offset the HBB value by 13
To: Connor Abbott <cwabbott0@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-3-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7E5kUfJBVQG5Bk8nQTG7uqA7s8LjifuUtU9VYhpGAhNqA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7E5kUfJBVQG5Bk8nQTG7uqA7s8LjifuUtU9VYhpGAhNqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XL0wSRhE c=1 sm=1 tr=0 ts=681df564 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=HXtwfQqbK82wVydd0M8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: KGLHgSSF7oLZRFBPY6C42txg4H9WK9Bt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyMSBTYWx0ZWRfX8MsIJjwemahX
 1i2ifrbyJoIREIFDDA2ioWyBRnyL3U41jvd9idODdO0M+KH79yf5YsHdPH1Yt6n8vRPsMIWldPx
 xsPC5OXbpghY6HRYNzX6zsk0J0QGmsajZPKB8iJFeYQjf8ebhNkYcmQ4s53wmS4ZyynLxLVRXNG
 /KTWJl2jiljlqEAOnxG7wNOjcRMLBr9oZSQQbaOuBxRCk+ULtBH0I6ZgM65KPd7BG3uNG4vkYwM
 QNIVYdhg7jeYjk+R6iWW4BPvkt5ypsyg5hxllr0a3Pf+b1H3Xm1pjv0SXo0ao/Bo1LzVLOa6KoT
 +C2gZ5skU3Y3Kzlw/Xt2tV/XmAObE9WHvqCnWewbSdAq7sx/vxAVFfTZ7AJr/5Xau3Sh059vHq4
 1yBx7fqZVtz1ujL8vYGqh9xuwKVuY/+R6/I3fjXcbv/UDf+W4sykIiaFZNqiui+gVXoM4rzu
X-Proofpoint-ORIG-GUID: KGLHgSSF7oLZRFBPY6C42txg4H9WK9Bt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 mlxlogscore=851 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090121
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

On 5/8/25 9:03 PM, Connor Abbott wrote:
> On Thu, May 8, 2025 at 2:13 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The value the UBWC hardware expects is 13 less than the actual value.
>> To make it easier to migrate to a common UBWC configuration table,
>> defer that logic to the data source (which is currently a number of
>> if-else statements with assignments in case of this driver).
> 
> Don't break the value exposed to userspace!

Bah, I keep forgetting it's there.. I think I'll alter the mdss code to
do a -13 in there instead to make it a little saner with the future
getters that return the x+13 value too.

Konrad
