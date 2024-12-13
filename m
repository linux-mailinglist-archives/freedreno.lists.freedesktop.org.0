Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B9B9F1074
	for <lists+freedreno@lfdr.de>; Fri, 13 Dec 2024 16:10:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 166E410F048;
	Fri, 13 Dec 2024 15:10:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mK8J6k93";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0F910F048
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 15:10:54 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD9nqZn017524
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 15:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LMIc4H61MSX6NhiZyaW7yQQ8yYjrJ8QN6wNQuoNHEE0=; b=mK8J6k93itNSQHVL
 3K2T9rLsizlfRH70pfIh13QxdWITiqOKxT9q6VaMTeU6Ek2qbGChXYlLlgS0K+GQ
 MBsz6hxU2GRFXe080hRCYhHuY/ja5INxatSXQWiOYSkSvXMIg2eeDqUIJ+jyeCVg
 W2OktgAHNaMPkt7haa2AWqZAyvOgLQ0iqCdDOcWwIE9mTKTWdee/A73uZHv+M1lr
 SaaWjleMW6osd4hMaIEZRknj2Sxb2dqVDpoH4mdTx9ITM+08BQ6Cg7YmTaF1eh8N
 yD1sGzaX6GMAbk76eYtOC2ZmHOPhGrSC6T4KS7BbhIDkApo2ZwLaUP0s1GqvBJiZ
 A5vuwg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gjmt0w6b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 15:10:54 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6d8824c96cdso5041746d6.2
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 07:10:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734102653; x=1734707453;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LMIc4H61MSX6NhiZyaW7yQQ8yYjrJ8QN6wNQuoNHEE0=;
 b=sV7uK1azb/LUFYI7j6kW2XK45NS8bsIBYmBh/ROfnnjIFNlOyRmMVwx03Op+GKBVGX
 he/wQfRA+J5pj1X5dro2PUVsOxtu7PGZZLY5c3XQXmcVXxSbEygEWbI3qCqYqbqHutiC
 DIVzHoyyCmGOMSWrvSH+j5Bzx6AiBv7TjdYREVRknDFL1dwJwfcnGBUN4pqyQ95zMQCA
 Zd4kYHYcIM4WszjKSOB30H1etpOe5hvHUnyMdN7d0WW702vi3eUYhJUFzj+Ud5HhbbH/
 Parqa/PU+8S9xPOTkMleQF4hvFisBQjs6aWnod0U8J0ETnFYGf21s+/u4u6xt2WnfIFf
 gcFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdtlaZH0yjUxChudiBHlOpna/65JI2i59R2znz3XCxaPDLl5Kg9PUkjU8WRq8nY/FCSNIBqNWKOto=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzUz/lTRfNJ4a40+L7w4SdOyPXM2I7jqcCJeg4bZjth9kUtbK5
 M1elJneSIlgSztXbyajKDMLjIintbK1hyYfUCuuDiPOHv7YK8JlCaFIzYHPIzk7DIsNCB+WNPR5
 cJ9lns73JhRo0lLcAMkPKJd3ERqDlg28cPoh9mgIpuAMc/R+1obqQhmHRHx5SLTELdCE=
X-Gm-Gg: ASbGncvLDW9iXgdkqhW3OycEgStWi21Kh40YM23bBL8ro11FtuHOEGoBz/7EjUxAF9j
 X8DaSaJERjARjD4zPVE12RPS8Uo3s3eZKkA+vsJryAgreDO9BVB7xGVWfu4x3Wu9gkZxRr1pa6i
 A1dfhKMOzFGuL2L5trSNQn7jJjnSwfCli2/kP41bEgIKyaY3bAuEH/ujPqR7DK2gMPtEs2XMMc7
 T28fXlkeQR4QRGeVslkGgt9xIMT+cqeu4oJpMLiL2YigjZeNz3cCjlcEeOWCVqvmz9JMtyOKuye
 L2apioVOcTOc+FahYH+JZwgdtNpMsxAp1Mvj
X-Received: by 2002:a05:620a:4609:b0:7b6:ce8b:6858 with SMTP id
 af79cd13be357-7b6fbf3267fmr153298885a.11.1734102653264; 
 Fri, 13 Dec 2024 07:10:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXTG+90+T6m0TzrCRgHC+VZFlf1IXbKAxpR0NrkdAYlucCrf2kmttpqZI7dcBXlrZ51YZyFg==
X-Received: by 2002:a05:620a:4609:b0:7b6:ce8b:6858 with SMTP id
 af79cd13be357-7b6fbf3267fmr153296485a.11.1734102652746; 
 Fri, 13 Dec 2024 07:10:52 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa683a0a736sm746086866b.142.2024.12.13.07.10.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2024 07:10:52 -0800 (PST)
Message-ID: <a31a60b2-429c-47f6-af8a-57f14163a4ab@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 16:10:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 3/4] arm64: dts: qcom: qcs615: Add gpu and gmu
 nodes
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>
References: <20241213-qcs615-gpu-dt-v2-0-47f3b312b178@quicinc.com>
 <20241213-qcs615-gpu-dt-v2-3-47f3b312b178@quicinc.com>
 <a41eb4ab-2045-49b3-b571-b49eb5a05057@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a41eb4ab-2045-49b3-b571-b49eb5a05057@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: __FkJxqvRXYwkC6lTnlrHx9aO1C8l9M0
X-Proofpoint-ORIG-GUID: __FkJxqvRXYwkC6lTnlrHx9aO1C8l9M0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=663 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412130107
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

On 13.12.2024 4:09 PM, Konrad Dybcio wrote:
> On 13.12.2024 12:31 PM, Akhil P Oommen wrote:
>> From: Jie Zhang <quic_jiezh@quicinc.com>
>>
>> Add gpu and gmu nodes for qcs615 chipset.
>>
>> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Well I forgot I made comments on the non-resend version

https://lore.kernel.org/linux-arm-msm/a44027ee-40d3-4552-8f61-bcab77476f68@oss.qualcomm.com/

Konrad
