Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A97AAA5190
	for <lists+freedreno@lfdr.de>; Wed, 30 Apr 2025 18:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5DB10E7F5;
	Wed, 30 Apr 2025 16:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ampATIP5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6000610E7F3
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 16:25:29 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9Ls2U015145
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 16:25:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HB3+gmI+ZUjqI0EbN6CC3IxDFDjjbTNSLHMPATn3Z7E=; b=ampATIP5DmHRxSg4
 iPiUpHLI5jzJ7/fxepbhbJZcUsMEd6i0GwAfIXQZluBqewvvfU9RM7xeKlcEes1G
 8hXP1aRm15zFAG0c93TFyfxq7g+UKgfR0yz3zgSmFMLpVfscFDFBxHkauEHOsiYp
 Pt70VYRSsdHJ2yqrjBjSb9WTrvxWOOxnlqZQIazV1yEz4B+TnsYWZUbkFQqpeXA/
 H91sOG7BC9t3RVPbEUfkqbbSCS/Bry8mbjnzRV+g6ZAR6Z0Nf8DrnBYrU3qZLSeO
 xjIrLVC8HRXDEQe0CTNNRMMS/YZjrVn0TGgW7znvyqrGA/9ooDHUe42+W434pSgf
 Cy8qLA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ubjuxv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 16:25:27 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6e8f9c5af3dso116026d6.1
 for <freedreno@lists.freedesktop.org>; Wed, 30 Apr 2025 09:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746030326; x=1746635126;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HB3+gmI+ZUjqI0EbN6CC3IxDFDjjbTNSLHMPATn3Z7E=;
 b=V1NIqyYMnq5O1sbLGgmuUJqWT659qzDXKtwyFB8EVT5vCd3o5K+rPGHw3EI/R7zAw6
 8ygz1PEi0ovvk0PnjIb0UuWDLcSPnZy2uWpScRw5Ozth/tZjsoe4wV+qM3MER6VUJ20S
 r+CZMN8Kpw9aV1PqhvUhrjVqRJdKG3AgQMWyn1j4K/4X6iWH6+J9Qvn4m89L+Prj9nag
 F9lR9zPCE2kacf2kx00k1eE3PMwTBdaYyrqEE2m90DOnRr/qnl19u3PO7PCRQo4ekK4+
 QEdRL0ERhQOjagazQdcWIPT7JFxq2meQ3rs4A0libNNx2XG8onhka6c9cU8B3U37B6VC
 Eywg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUe2eA7l2DTNvcKtoI+HQeNntK1H5YWnQqKSrtoB4xzUMt2HAPAkIT9DzvFPBu2OPlr06TNf6UsDkU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkoOI/seedmhwAP6mjh4e1npH1LnJNTVd3UlLH4JqNuDNfncX7
 vCJ4wBlLITBQOZq5gmvcM/8UeVl0mSkmkJO6kkMj5ZcMq4E8WP3QfrZGyQDfV8RhrvjVAc0It4a
 KwMlIqKpr/L5nDvEK0IdA2e2frHe3oDYi1xhNfBpSqonESC1/xv8jTd9UBYJhtS8jJ/4=
X-Gm-Gg: ASbGncsKHp7UCzeUa+VYzeLAWFXH23uXq7gxhiAGGSLLF3gmQoOA0QZWDn735yLzaIR
 cuGommUWA2dQpecMLr6sHUzO/Ta29Lw0MS2OyhmdM8Iezix06/cffBTzfC4CM9E0tze/MZ1A3wW
 tmQ2m9+UBLOl9G8hFkprDQS0P/lIHeybfPjGDQLqJKbtuWbPYTGYr4CPbsb1+cJJJ4CpmdvlhRl
 6+DBCBgU7kbfiqZGaOs4HzPzLzbJeF1hB7RVMqMDHXp5brsb5uQ7wlzfpXtmAok6FD+15k5/Lpj
 G+lftxKHvjTU19l8COpFiei2+5w27lCcgQbfkYT+lxHrAFmjWh8mB4J2uC8gP/ZOP8c=
X-Received: by 2002:ad4:5c4e:0:b0:6e8:f88f:b96a with SMTP id
 6a1803df08f44-6f4ff2d2924mr18870016d6.1.1746030326696; 
 Wed, 30 Apr 2025 09:25:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxD7HkUdqpnN+OfcCIzsrbn5QNU9jNDG0l1/EVlSKXcQll60BAsotjGUkxYzwFZKHAhPp+vQ==
X-Received: by 2002:ad4:5c4e:0:b0:6e8:f88f:b96a with SMTP id
 6a1803df08f44-6f4ff2d2924mr18869466d6.1.1746030326152; 
 Wed, 30 Apr 2025 09:25:26 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f70354633asm8799526a12.55.2025.04.30.09.25.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 09:25:25 -0700 (PDT)
Message-ID: <ee44260b-13cb-4901-a073-2b9bfac2a794@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 18:25:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT v6 1/5] drm/msm/adreno: Implement SMEM-based speed bin
To: neil.armstrong@linaro.org, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20250430-topic-smem_speedbin_respin-v6-0-954ff66061cf@oss.qualcomm.com>
 <20250430-topic-smem_speedbin_respin-v6-1-954ff66061cf@oss.qualcomm.com>
 <68a2cb9d-4f3b-4bfa-81c3-2d5c95a837f3@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <68a2cb9d-4f3b-4bfa-81c3-2d5c95a837f3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bGePXH8_8xMh7Hzb9162yA9nCoufQwHv
X-Authority-Analysis: v=2.4 cv=bsxMBFai c=1 sm=1 tr=0 ts=68124ef7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=h3lbVRRyGfeKgUivn1YA:9
 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDExNyBTYWx0ZWRfX5ol/88hmxsoU
 EtBClgYtjU91JkxSAPH8OEy7WJHv8ADM3W81R+wliNnF/jEz8mSvQdLI7or7niTgChhXMJekMKa
 JLeoqt+DiNdwHl/BuFCFmGnrOqcxzmHGsEqKaGVTVsdIBkSZYiCxL9qdYZ6HVlRpt7wgmtN6BCe
 E6C+Bb8PjKZyV2Bfe6D9LcgqoUh6W3B6YoI29h+Qn1SUywZ53YYVhIayoMxfM2J+mDXJV50j/ww
 Qqw81ZyR0und/fwxWfI71L9Vr8x1ScPHQHIQrD9Xk0ad9btk4MI57mN/D3pg4Te+iIo/aie7Pwh
 OKx9cAzfs0oLUpGEJyJ/wNCn43PoHYwad2ZxIC2wuPHkKiL+HriIr57y7AqxWyqUuzAo7HzMZab
 8lIWhpIGlNb1Qmk011qGcR++w8cG0zBZvI+vpTByRgjA1OXoJFI7iBtl5yPEpEI1UPmuYc2M
X-Proofpoint-ORIG-GUID: bGePXH8_8xMh7Hzb9162yA9nCoufQwHv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=815
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300117
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

On 4/30/25 6:20 PM, neil.armstrong@linaro.org wrote:
> On 30/04/2025 13:34, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> On recent (SM8550+) Snapdragon platforms, the GPU speed bin data is
>> abstracted through SMEM, instead of being directly available in a fuse.
>>
>> Add support for SMEM-based speed binning, which includes getting
>> "feature code" and "product code" from said source and parsing them
>> to form something that lets us match OPPs against.
>>
>> Due to the product code being ignored in the context of Adreno on
>> production parts (as of SM8650), hardcode it to SOCINFO_PC_UNKNOWN.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---

[...]

>> +/* As of SM8650, PCODE on production SoCs is meaningless wrt the GPU bin */
> 
> This should be SM8550

No, this is 8650 to signify that this holds true even later
Looking into it, I can even say 8750 here now

Konrad
