Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C03DA989A2
	for <lists+freedreno@lfdr.de>; Wed, 23 Apr 2025 14:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F370C10E1C5;
	Wed, 23 Apr 2025 12:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iEfdqrJv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D9410E1C5
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 12:21:47 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAjhDP020451
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 12:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yEy3BB74MydlFE5SvSBjX4VOfZhaorZTjCn7mz9RhEM=; b=iEfdqrJvitZsTSxv
 xsGCnrcjXPQ2IcWoKVAnGGCLzDRIk4aNsh8+XceLEgtJnBHzppKtkd+PX0XgPy+a
 /OkacEzWoTkABAA44fkCf4sbZ/umnbmaBjr7/E8pFzFzwflwenKcY3iHtwqUFxX/
 yy0NRf1fuFuESEyfU1CJv+pyi8cY2grdbFYwBsVJFg5uFktiiZz27uPCFdI8S4YY
 y7xfEZfaona7VSXAXKXXC85waLtsZlL8PLEC+e08Ort8NOFMbtsJFzywu0Plzmlh
 rZnTjZled51CzoiAENbgJamTBVAMIL7HsfGVDN46I1QOA/BOXBzkQJ5GUysx/yKR
 IFpN8w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2239m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 12:21:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c54be4b03aso106644085a.3
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 05:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745410905; x=1746015705;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yEy3BB74MydlFE5SvSBjX4VOfZhaorZTjCn7mz9RhEM=;
 b=cmdG+NYGMf5NN7S//9EOvEUVZBcPa97L31mt822IVb/rrAOWu1DkmXwZsnt1KDukPx
 NE4nSrN3O9JcpBiry2il0HEdzELwf23E6I2MPl+We5F2hol0rLCjRPdnrW1nkzGNqaOQ
 okCQBE/FLPYGnquj0AOkXPFeMngEL4b9h3cl4BVSwQxJ+YJSWMWb+uWA4qjOrsOTOK9J
 6dh7bgSc2GeHb6rIj8/v5ciDbu0hvUzbrY71E9A7p0SzgCoddxjo73uQmW0eURVVk3U+
 tBq/hU3Z0sn2N5T+U9xTfn6PmgfygonWEB7d/QMOBTFAAvhAHywrL9iQLf8KFAKLl0dg
 HxvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUq0zJ8zcXCeminuWaYT6aeyBwv24w4DfFolj6ciQMrSTK8rDUCDmoaP20ICxIORlwyvm+WF7ZYqH8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxutG1NYhG30YMlc9ZRwcDRYHpXOteyD/cMbk2u1EjmkxGZjxZz
 hmFjsfTj6FSBaHH3ynztJOU6/aA/MBAbU6YfDrjNHkFWJmlMfjAwTK05VvSZ6aQ7j3FghpQngNT
 HC51+u1zcmJh6oUFmw7L3E6dXbwUOiIUaBvoB6gqqjA0+pRuSaYD+a48TTZHRmux6V8s=
X-Gm-Gg: ASbGncsXm7Lj2UQ0mfVo/LT8HNmDeRBVILDrQwNSf/1mxXKnsWJK0Fzf7qvycklOQ8k
 tF8fzkOehBgHplUjOuDNyLFjniVwd6+E1a3pKFuAUUQxRfhIW+xqJx1Y3Qk4/AsoJWKYW6IcRNS
 BFMzVSXcn0P70utDsqz2piw+t/QReHCnVKONptDZY4eC4P2DSlID4EcPiy0Tu+4G6jwzPuS+hGB
 3/+oUVkuYP04dqRetNdSgcIZpzlccOSvTFYP/IBcM34SacJOICNMBKdp5sh1FC3adpqj8TMpX5H
 QjGe6DB/Ozl4SJHcWEqfE+/O0ohnldbnd/Q01BjEJvrc0NSwkC6hhdXOmUr53INrBww=
X-Received: by 2002:a05:620a:318f:b0:7c0:af16:b4a8 with SMTP id
 af79cd13be357-7c927f6f902mr1108011085a.3.1745410904999; 
 Wed, 23 Apr 2025 05:21:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXBbDZMwLarl+zI6FrhIiRzh9IB3F9PW0wtQy5FUQ3y8e0F2Y8/CQ5HRXpH8vW397/Zsevcw==
X-Received: by 2002:a05:620a:318f:b0:7c0:af16:b4a8 with SMTP id
 af79cd13be357-7c927f6f902mr1108007685a.3.1745410904673; 
 Wed, 23 Apr 2025 05:21:44 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb6ec4c622sm786854066b.44.2025.04.23.05.21.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 05:21:44 -0700 (PDT)
Message-ID: <ec7b53a4-0321-44bb-938d-0cb955e64397@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 14:21:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] drm/msm/adreno: Add support for ACD
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Maya Matuszczyk <maccraft123mc@gmail.com>,
 Anthony Ruhier <aruhier@mailbox.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250419-gpu-acd-v5-0-8dbab23569e0@quicinc.com>
 <20250419-gpu-acd-v5-1-8dbab23569e0@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250419-gpu-acd-v5-1-8dbab23569e0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=6808db5a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=pGLkceISAAAA:8
 a=b3CbU_ItAAAA:8 a=EUspDBNiAAAA:8
 a=rNhkmTvpKUHMLWWBcFsA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-GUID: 3hjTRAmLY1K9Xiq8zGJMDUr4RHY3IV6r
X-Proofpoint-ORIG-GUID: 3hjTRAmLY1K9Xiq8zGJMDUr4RHY3IV6r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA4NSBTYWx0ZWRfX1hc93KFzYVaQ
 cVYR+1B+Ksf8GvdOD6cz0Dxn2j1mg5FH7sUdAizjdPAC/R/43FoOJov78xVsgfvl5p2iSpLcPV5
 91quc/IqebLMJF4aL+FTr6QZxbQ2P7HOVOJfmAs/tL4HuAY+pqaq5BammLj2Vco0sxO36wvyWqt
 R2Tybl6UpWVfsYUfzijIGB5IaXI20ouJdHALgB7q7EGR4u7vZjvs8RaDLme+LAMKAizMAmACyDL
 I7U8xZdnxVCYVJspmj8I9fSbayXwMgYHuOSApXERfZ4JcA1H5aUyxa6AkTM04CJEV1IJXGpJXaC
 WrYn/RsWyuccNlR8DpnSQUQW2b4jGMMnG3ee1k42Q/E2mfHTy4dkrD1I4Ex95ewQ1oS6w4YJUpZ
 Ga26WB9GaPY+t/JBnTivOosUAqSSGJKFSQrDIQ750vryePeXxo2ManM2buUWloV7MAGN/zGJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_07,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=977
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230085
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

On 4/19/25 4:51 PM, Akhil P Oommen wrote:
> ACD a.k.a Adaptive Clock Distribution is a feature which helps to reduce
> the power consumption. In some chipsets, it is also a requirement to
> support higher GPU frequencies. This patch adds support for GPU ACD by
> sending necessary data to GMU and AOSS. The feature support for the
> chipset is detected based on devicetree data.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Tested-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Tested-by: Anthony Ruhier <aruhier@mailbox.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
