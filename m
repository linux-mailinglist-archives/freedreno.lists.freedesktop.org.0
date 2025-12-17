Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A815CC7FAB
	for <lists+freedreno@lfdr.de>; Wed, 17 Dec 2025 14:52:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E712610E58B;
	Wed, 17 Dec 2025 13:52:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IilCwr4h";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RFHJdNw7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7737810E05D
 for <freedreno@lists.freedesktop.org>; Wed, 17 Dec 2025 13:52:37 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BHCL8HH2042944
 for <freedreno@lists.freedesktop.org>; Wed, 17 Dec 2025 13:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MUcFSeForpgs1zaOWkq8M3g4jUQqfiWW8mZI5c70ols=; b=IilCwr4hKN14NE4I
 1siREeR44j54HJR1QBX/8we3n4wgCQr6ZmKT8NMxp6BHsqt9RbpktPpTJWfGLqKy
 t7OWuDEpvSdMe5lXZihFb3rXDZEJEBvtsYxDnAE/eidS/xvHd8Qc6xV5QlLGy1+k
 Giv6yLboDdA79j7/bNSnbhwMUmenZcWDqtd9LWT/1331gfscwuJ/UdtfagI8Sf9J
 iR6+JnCmhynarrOeV9/ndcjoU4xmRdj2IQWilw6j4FteT0JsnWEg4dUT/IGO5wD+
 0+sv8rX3t0uM+wpkbbsjJRZSypUMwCFDJcz3zRhlqcnVLtTPM3bYmCv1KPO1FhbX
 9YACYA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fj1tk9r-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 17 Dec 2025 13:52:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8bbb6031cfdso104180885a.1
 for <freedreno@lists.freedesktop.org>; Wed, 17 Dec 2025 05:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765979550; x=1766584350;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MUcFSeForpgs1zaOWkq8M3g4jUQqfiWW8mZI5c70ols=;
 b=RFHJdNw7yZrBF2RA/9YzVuc8xH4PaoViOjlpf64CCWZ1/31RrJtCYq6fm0WmJsYTwR
 D01li/5VszWc5wQaT4+m+dBUoPBliJInJD5IHy7ywGi54Ra8EM+y6myVh/F+bRgYMoL/
 zrr66iD0swqKTnL/3W8yCp7kEuAoL0mw3wsDh+4B/Jeppa9heF6eCE5vx5p7vs6aben8
 yLIYgGc473By1QPnzt2EGV75BeAuztNvxwUeH87KiyhnqpMZkA6rIQJ5GCcL6L2v7He2
 YnEzbljSaCgMn9jBdcGN9ALDwMTPOwypl2cM10TokmbH/EukNEqij5ZzhJqcn5OgJsS3
 pnzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765979550; x=1766584350;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MUcFSeForpgs1zaOWkq8M3g4jUQqfiWW8mZI5c70ols=;
 b=KHbsaQ44PR2zgvJVWvOse2GVdVBnVlPHmOqh1PxeTdt/NoS8VP3wl+y3yIbuISZ+Fa
 OBJCK4dN0fwwCQJJoK3ztcyUjf4EUHcLXMR3df8lybs1sephwz6LJHGKq5g72Pcom/ZX
 Fa5e72yT8Bm9/4sf17N0LBXWMh+IFjVd8kyawCDdi5rzJ6aPmai3+U+Ax3oJvnieXqHb
 4kIzsb76c8JyT+Zx8brKVfIh9xx76+d6jyq9vUz7kB8HXRK3J+Ih2mfOORFCpiyl6+dC
 kDBnKqUggZz0TjmIeOLgexh+j/l4DOlhjtHIHt0t0F2t949RxJRLwulsgQfRC9p+wfkV
 KpHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5/xb6wlwWMzwdnbxS88059NmEecph1JnefFRl4mCdqoB7266gMCceCYW0XFr47bqT2ptnHKSo8SE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywm+L7/U3lUdtBlPJbXH8hAEns84sZPtEjNq4dda00ec9R/sDr6
 +Sruwfy7qA19qFAXfoK9Y0C7lO8wD9rGyTAbC0w4wk8UhSaNBhmwUyae+g/cAr5p1kYUgOFdiS2
 k5ROz2WNODJ1RzVdktXdQJ3vZclZY/P7voyGw077pqF/4pewDa4dvmTEPA12+O81yK2FucUs=
X-Gm-Gg: AY/fxX5eK1wCLJr3PQbGDNWiCKYTApIWbC5PY40AJ2vh7uL1msKP5QR1bx4WE0ziKEy
 XZLk+eZU0Bus0KdD6ixzGWD85YcdcEfip/DApU9FuG5A3LrXq2daKzHCMw9Wn2UxbizkFsd6Xv6
 l+oeWGdaNJX0tQzqOfZyZCquO9aBPppzofjaIv671wVETAq9KF5pHb+zgzBwsn6dpSlCyb2DRTd
 5HzYTohf9jm58g21IKoGbadycwy17lE1I/8ILunfI/o9rUpdVg+UseAsu0tz4SMN2OHQEQe3yMr
 F6K0z7RI7F8b31/3WZdab9HSfb3TRJCT8FS+qynJtsa550wFwc4s5TE9FKW0SoM4gH5TedY6YmJ
 5Yh8/oRr37CqGjt6w99bqYN4J/fkjWNzF41ll0llRzrc6gc3O9SlYLJg5HyaM6ybifA==
X-Received: by 2002:a05:622a:102:b0:4f1:b580:fba8 with SMTP id
 d75a77b69052e-4f1d04e6df9mr194857911cf.3.1765979549948; 
 Wed, 17 Dec 2025 05:52:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHn8FBGFvWlziwKU5p3n+hs/jstKbKvea0UICNhQkpwL2yQQ7Zau1SiOTq9MXzcJTbdWmhfw==
X-Received: by 2002:a05:622a:102:b0:4f1:b580:fba8 with SMTP id
 d75a77b69052e-4f1d04e6df9mr194857621cf.3.1765979549545; 
 Wed, 17 Dec 2025 05:52:29 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7fc04f6015sm1054089766b.50.2025.12.17.05.52.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Dec 2025 05:52:28 -0800 (PST)
Message-ID: <5dc3d3e0-a338-4f2f-8987-5705fc1fde51@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 14:52:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: lemans: add mdss1 display device
 nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
 marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
 abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
 abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
 simona@ffwll.ch, alex.vinarskis@gmail.com,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_riteshk@quicinc.com, quic_amitsi@quicinc.com,
 Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
 <20251125105622.1755651-3-quic_mkuntuma@quicinc.com>
 <32f013e7-ce2a-484b-8575-e98f2d23f59b@oss.qualcomm.com>
 <faau2h5z53frwfply57oh75zr5gcz4gf3za4vflbyht3ok4zgz@2ylcwcqcl4rt>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <faau2h5z53frwfply57oh75zr5gcz4gf3za4vflbyht3ok4zgz@2ylcwcqcl4rt>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEwOCBTYWx0ZWRfXw7Taigpq3bzZ
 FfD+CvWvYvRMqCktm/4mMSb2PFuLw3/rqAnyOiNS856Uxt/dCKZCFgN0KOskreUYltz+onwmTN0
 TvZz7dIoO/Ye8LECwFXWKBCE+1iSwbSxQIQOzcbc2JyZ+2FfYHKlAVfaTcHxiQuXcmPOe1bA2q4
 /f60kut0lD9JvkIxLxa7Q6XxCPSfvpyC1XEY9li3ormTwpoewjT5ANWbgx9PkVmpXXZSC4WLAPW
 JhXBaeCeN5EUK5myJjA0CcR469e0EcS1ZG7eGJZIuOzItQYoYDrpL6kqd3vhuuACnmK2AXvPsOS
 IX7vh++6pM9dW43WMFnJxX7dVAXwAfi8YZx2jB3Po4s2aoBhQsYYszjjAQ4U4rsjXbPWbCB2S/9
 uQ2orATAbf83Hhy74T92G/iFQ86jlw==
X-Proofpoint-ORIG-GUID: ovMxT3A-RAcMAn-ULKxNADBYfMkTXLkw
X-Proofpoint-GUID: ovMxT3A-RAcMAn-ULKxNADBYfMkTXLkw
X-Authority-Analysis: v=2.4 cv=edgwvrEH c=1 sm=1 tr=0 ts=6942b59f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=CW_yPJa_05T0x9ChYMQA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170108
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

On 12/10/25 9:21 AM, Dmitry Baryshkov wrote:
> On Mon, Dec 01, 2025 at 02:35:44PM +0100, Konrad Dybcio wrote:
>> On 11/25/25 11:56 AM, Mani Chandana Ballary Kuntumalla wrote:
>>> Add devicetree changes to enable second Mobile Display Subsystem (mdss1),
>>> Display Processing Unit(DPU), Display Port(DP) controllers and eDP PHYs
>>> on the Qualcomm Lemans platform.
>>>
>>> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
>>> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
>>> ---
>>
>> [...]
>>
>>> +			mdss1_dp1: displayport-controller@2215c000 {
>>> +				compatible = "qcom,sa8775p-dp";
>>> +
>>> +				reg = <0x0 0x2215c000 0x0 0x104>,
>>> +				      <0x0 0x2215c200 0x0 0x0c0>,
>>> +				      <0x0 0x2215d000 0x0 0x770>,
>>> +				      <0x0 0x2215e000 0x0 0x09c>,
>>> +				      <0x0 0x2215f000 0x0 0x09c>,
>>> +				      <0x0 0x22160000 0x0 0x09c>,
>>> +				      <0x0 0x22161000 0x0 0x09c>,
>>> +				      <0x0 0x22162000 0x0 0x23c>,
>>> +				      <0x0 0x22163000 0x0 0x23c>;
>>
>> The last two regions still happen not to exist
> 
> According to the memory map I observe, they do exist.

Hm, you're right, I don't know why I couldn't find them in the past

Konrad
