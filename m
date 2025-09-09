Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A54E7B4A6CF
	for <lists+freedreno@lfdr.de>; Tue,  9 Sep 2025 11:09:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8228810E66D;
	Tue,  9 Sep 2025 09:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nLKhNHL2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE80E10E66D
 for <freedreno@lists.freedesktop.org>; Tue,  9 Sep 2025 09:09:42 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5896SamO029695
 for <freedreno@lists.freedesktop.org>; Tue, 9 Sep 2025 09:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xQLSJJKoOAxMywKNQ5ccnaCy0rBzwUBIGaUQg1SaW2A=; b=nLKhNHL2ewzJOPud
 lZhZtHzpkeoIViVIMcU7VaJf1n28xgKVWSCY74A8qqc8NAsyDfDPdgpNfqKqs5S8
 DALDhvWpu1iOU0eZEeKh014H+CYEOpDICzIvxMlPWJus7mG+vTUN4h6bt3qfUMDH
 raoRK5dImM2TjFOePAWN8g4xZcgx3keguaBxIibSZNzQUrGaAqjJB4XakATEAHqz
 JYk9zbodMs8kWnhZUhgKP0OcE/rqc57I3sDRiyfNHOd2O3K62rq1rgRdydDLUNIZ
 2BHXMxLQ3EPK9L+UizGxe8aL00oltypYg3Hx3Rps+iaVKr/LafMXbKmeKswA7izl
 xOaggQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4kyh57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 09 Sep 2025 09:09:42 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-721c6ffab9cso12779386d6.2
 for <freedreno@lists.freedesktop.org>; Tue, 09 Sep 2025 02:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757408981; x=1758013781;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xQLSJJKoOAxMywKNQ5ccnaCy0rBzwUBIGaUQg1SaW2A=;
 b=d1lvH5uhRX7FgG7qICtqVb6QFII4Ln5oQdKfrlQiGAPUpj4GzbDRYq7A2I0b54PKBr
 JMqteKnr/ZmrVxLoboTObUqqcMilqeJznHgQB6hWGfSoi5rbu6ea8DuuxHwBP4izNU8Z
 o7AOssFiqHxdc5Njkf8SYaGYNTKiCS8c3IicWoGBbSevFFRD4Kpr6EGsliksgO2uvq3h
 vCS6aGq+V3Z+xbs8eU/6ZLmW5LEzNZWQ8tTn6iaJrFL7MfBD8gQ43QwnIakxPBVJrxmA
 o4uDpSNS/ISQHVnuzPJgHdUoAdIlIKLztMzLfwjYLevExUny3poBVUfpB1aEjlVwdJFU
 7W4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbDRFr0RKZNy31Pbhr7jSrl9V3mx3hyxgJTXioXrOYPOb2j9JRJY6Mg3O0sOU1bd+nny1RsLITdfU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJ2CsC/r7iTO3wPjSEN4AYCRWoHS/aTggXSwOHqdc6LnV2iDKG
 W4xWMlm1+625AbENoj7rO+hq9W/7P3ywQpOlWNjz/HoElubfognTY0yKSh8l7VRH0jwI4pgEBhw
 FWBIblRwhaZ4ti21spUXdqIv7m6rD1SzoCdbNZ0FjSD1ejyd+OSZ+zoG48yDmgg0G756KLO8=
X-Gm-Gg: ASbGnctDgrprlmWrbRmx4XwkJlk/EPkaS49x3Tjl1+psfi+hJwVeMRrR0AQalI7i+ZF
 NFypzf9UAUMCQp4GXs+389+VpyZv2MO4E5J1aL3erfzftn28RETyrt2apOhZm5az2Ybih+9VKs3
 /jcfcoCo2LXwcUDFILdt9knFdTNb1z4SCGJ2XDSd1g+b6FeqN6oRxio1bYrAx15Bhw0Rmt4ta2F
 eTPjb+uDaacOkcTcFTzIS9xOjdF4gTbG1UGCl5Te/SuUh+IW509l2iYesAQT7z5Xwt4IugKX0YC
 r5xFhzzPRRqPunIP/QiHaj6KzhsO39MQj7ZxrFEyA2yfbkw93jiTLbwtOgERH2HsD1T/cDqN08h
 VWsHOCpQnFdyqMbceiNkWxg==
X-Received: by 2002:a05:622a:190f:b0:4b5:f4c0:5fd with SMTP id
 d75a77b69052e-4b5f8531717mr75859041cf.8.1757408980802; 
 Tue, 09 Sep 2025 02:09:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElaS7VsMyAK4sn1lpqAU55/RUqGD6nhMUESe+uEL6+M2kFs4PMy1dM3B8kVdWzzm0FbO3i4Q==
X-Received: by 2002:a05:622a:190f:b0:4b5:f4c0:5fd with SMTP id
 d75a77b69052e-4b5f8531717mr75858671cf.8.1757408980330; 
 Tue, 09 Sep 2025 02:09:40 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff0d9b1b53sm2545589166b.96.2025.09.09.02.09.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Sep 2025 02:09:39 -0700 (PDT)
Message-ID: <b879cf3f-4216-4fe8-94a8-48244efbffd4@oss.qualcomm.com>
Date: Tue, 9 Sep 2025 11:09:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] arm64: dts: qcom: lemans: Add GPU cooling
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com>
 <20250909-a663-gpu-support-v5-4-761fa0a876bf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250909-a663-gpu-support-v5-4-761fa0a876bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfXwTVqHptJd7wq
 /fpW8O3uzf3h2gP/3OB1IvrPyYK3EHLhr5s+S85kblQlsQb+5vPPcFR7EWmyuTmoaB0nhmRVMSO
 lzMLonl/DcYh0CWjRNYSi1UeqRHMrFxDhJ09SfpeZ/ZK22f4vyugmcASCEZsgjJ/VJ4a9Gos2QT
 7dFCK0FczEnXyzV+AQGurdDrJH4bXsrCQrK2G8owUkCySATT364/8UaJ10V1opWrhEac/7KT4Eh
 SeMq9PrekJBMfLB1JxXRh68EE++AA3q8VZwyh89t6IANqFTK28ruphpU/4ctx+SKXCNLGNBOogy
 rzxKczpAQ78trsefH9QbUgKNJlbXenoxUo5c1tRiizM7gYUwlnP0O3v7LqL+u52jfseVv8R5Ddd
 WDBn95/A
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68bfeed6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=7IyadIS-_L4Ux7daf1QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Tc1VAUIvysT4mo3mxix33ePZ6Oi5b0bc
X-Proofpoint-ORIG-GUID: Tc1VAUIvysT4mo3mxix33ePZ6Oi5b0bc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
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

On 9/8/25 9:39 PM, Akhil P Oommen wrote:
> From: Gaurav Kohli <quic_gkohli@quicinc.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when it
> reaches high temperatures.
> 
> Set up GPU cooling by throttling the GPU speed
> when reaching 105°C.
> 
> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

you'll probably want to turn the 115 trip point into 'critical'
(which is fine to do in a separate patch)

Konrad
