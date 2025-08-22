Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FE2B31685
	for <lists+freedreno@lfdr.de>; Fri, 22 Aug 2025 13:42:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE9410EAC6;
	Fri, 22 Aug 2025 11:42:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cwgxJk7q";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2867210EAC6
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 11:42:52 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UIhB003566
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 11:42:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5mw/UDB/7pQXVTX2eHOkG8b9
 9y464ysBkU4PLObgT+4=; b=cwgxJk7q1Je0QT4YtcE7cnsP1azGpggAmhfeZ+Mi
 cJsDgR490szXH+nqyumFgucJnIVpxN3Rl5GRNRcx0dHxNHetTF4oFROK8L4rwbmx
 Ghlv9JH7CKgqLLhdGhnUFqXB1d+e/C4Y/P7SDkWmr5Q1GqyzF0k+AK2CkWD/8kzd
 1aTmVG56ZXxbUDpLygK5Thh+HuxEqZiPP5gTI+bpblBZOBXqWu4KM19kna3wpM6t
 hjVTn1p19wU9J6IdeWM1jSY4e/s6TMRFdxppQ60M841sfXYhobUEKwZQg3ppo8xl
 SapH4849HNVdbBYuamJhIUfPmiE5Xr6r6WzTYJlTZLDOig==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52990se-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 11:42:51 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70ba7aa13c3so78606196d6.1
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 04:42:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755862970; x=1756467770;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5mw/UDB/7pQXVTX2eHOkG8b99y464ysBkU4PLObgT+4=;
 b=ImNMQLFgHQIWOoaqycU1HzWgHVvnzcwQae+9VBESfhdg32Bhs+zo++jkr5Ojh4zxQn
 sI6XEBo1MUw9vlBXVCGI7IkOXrk6YpSySTRoCFQ9eyjOw4bFNgrZYBlnnLWY+jfEiVB6
 zTzd7Kqi4iNVLR3bsQ400iSVG52dibKb5qARPFY/tWGqnOcBNW8swy8WU0kbqZmNzjHN
 +Ze6um713rpg/L4r+qjGWeoPlgjsu0x8UUJbr9ETKXmJuAY6sHxVbyBT9B1ib7C5ie3m
 2WE4VaHSZuiEQwsanlpEu20qfxVYPvxCy1iTqosG1GD4d6GumOPlkv6SDOw6TxUPdYcU
 1TPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHMu2M5Hx4SKt8T2j8Qg9GbJrqWCiWuLZXVELelMbnY/ICwKksCqP8PyL4hef8RpMc2WdKJVYDF0s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyImQrLzkhAKhzu4HBTqbggAYrbW4WEcj7y22MfummaQKjIiEbU
 xk/IogpPxTI6ZP0o/2VPpkvb4Zczwl+lzxWnKN37kwg4YJuCxfHDdrdbZA+vVWJ66zvXOG6s0X7
 7QQZlC92cLLMafXexPRS1a1G+89jZwlB6qO3Pe5TW8/Q3w7tFJA53TOoNlMRzAncXksLRlm0=
X-Gm-Gg: ASbGnctKCGdKj9/jm6pr7hxC83I91GkuAAMJ3PRYmPqmTD5BMZqi7A7E3chmo896X5k
 QKaEwSeSgN18l3pNBdDBcydcBNBZlcmJiy5BvEnZdKjcLPjCzSuc85W+Ahlx7+UsMZlApTmeo4q
 LhFHs19iSbsXf3j42CrRXL/cZI5RRV5lndPjP8VyRT8FjHFs0r92wJ9YItSmKaDQDKZo+AMRv+c
 EYcg6rIUUDPrmPfVa5vdgDmVUIqo4zDEGqssrjFq/mw40mLPInPOFp0dtrXB0nqF9MijTg6WOp3
 6B7gpKQr7hS1e+pM3+Eo1RoqPP64MOW55HL23dBMTFbYAxT7nFuO64AapvC2ruINImRp1gcHpkf
 aABnxtEbtX1eHx1dMpL4YtrIVx/ELl5poesfiCsBZgxu2Wra2vqGb
X-Received: by 2002:ad4:5ccf:0:b0:70d:6df4:1af6 with SMTP id
 6a1803df08f44-70d97238c31mr25038856d6.52.1755862970499; 
 Fri, 22 Aug 2025 04:42:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0KTE4EBh/7HvpDzIMoDw2jPtywPhs513cF9E6lM3AxHNbAFd068WoyXeIrAeKelFl7dCsLg==
X-Received: by 2002:ad4:5ccf:0:b0:70d:6df4:1af6 with SMTP id
 6a1803df08f44-70d97238c31mr25038536d6.52.1755862970041; 
 Fri, 22 Aug 2025 04:42:50 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3354b208a13sm7287061fa.70.2025.08.22.04.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 04:42:49 -0700 (PDT)
Date: Fri, 22 Aug 2025 14:42:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
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
 Dmitry Baryshkov <lumag@kernel.org>,
 Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 5/6] arm64: dts: qcom: lemans-evk: Enable Adreno 663 GPU
Message-ID: <tapfkre772lrar4l6ik3houaq3ki5icqliu3tj4k34hvlha6rq@2tbmqra57bag>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
 <20250822-a663-gpu-support-v4-5-97d26bb2144e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822-a663-gpu-support-v4-5-97d26bb2144e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Aui3HO9P c=1 sm=1 tr=0 ts=68a857bb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=mhNRLu-bMZbuYH0aq7kA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: IefO5LCU4KZM8mYxNEYY23HDalfDZBll
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXyjLUJv59TxJL
 WEJ+rJ8B5USP15Rg19IRoz/sEtZyoiEmFf7CWhtjAcRYndWBHdTe1yOeL77/L72t6AS1uQ+zS94
 GUveZF7/BTVHLShbaoZo2E5yXokT/nsvPl+2yxKdwqlPXK5GgLIMb7w52SED8MY7pWeBUWqMfzJ
 5VJvnCoKerC+jqhd4mI0DoUkDb0WhDVbkvNJdItSmq692s+c8D8XmhYufgSxFtEhe7iWBNG7SWS
 qaJGnMouLV79La/NGSTXA/jgWYzRC/hle6zhV8tusomyqubm8k/n4EZtOt1/ssuAKzx9dqLuvqt
 /x5pMfLbejw0uyRuW1OsyWaWfNJeo19ITaE+N5LQo196+mR0n2JF2O/HIyv+xXxjq5OwuaAmX+B
 b8NUydIioW+gHUR82ZW0DTyIYGs5zA==
X-Proofpoint-GUID: IefO5LCU4KZM8mYxNEYY23HDalfDZBll
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013
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

On Fri, Aug 22, 2025 at 12:25:30AM +0530, Akhil P Oommen wrote:
> Enable GPU for lemans-evk platform and provide path for zap
> shader.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
