Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DA2A07718
	for <lists+freedreno@lfdr.de>; Thu,  9 Jan 2025 14:19:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B6010EDD2;
	Thu,  9 Jan 2025 13:19:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YdGSnLKO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A040F10EDD2
 for <freedreno@lists.freedesktop.org>; Thu,  9 Jan 2025 13:19:37 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5094gupc018500
 for <freedreno@lists.freedesktop.org>; Thu, 9 Jan 2025 13:19:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Fcos2SHO3ylh+6v6GhnN1Oisu/ti+XpNhYVMWRKSLHk=; b=YdGSnLKO6VXCIH94
 0ZjB6fK6UEn4Ma4aoX2U2CpiTksmAKD+ufsTRyLezBVcTuLBpTViUziSe/60UVzA
 Gku0n6i2MPLm0BemBkKYA3FIsmPTbmUbeTUYLxDhgrpwdJhFnldyKggUOhRp4NOa
 isUF8so41gZ3isp4fGk+W/7uE8nZ+Q4bZf/8stE7qhBr4NpXYC0fMYXhgQ8yUtNV
 RY3diK/zimLaQL7FsBuCWG2cuLKf24QwkUq5Z/tKfGw+fUd9mFBk/XdhEe/Q9Ajr
 oqeal4vnGqCcEsjTRxkPGsdGiiQKj4rtOWkmmxZzrereH2KThgZVsKboHBez+rV8
 yodguA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4427nws5e9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 09 Jan 2025 13:19:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-467975f1b53so2213201cf.3
 for <freedreno@lists.freedesktop.org>; Thu, 09 Jan 2025 05:19:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736428776; x=1737033576;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fcos2SHO3ylh+6v6GhnN1Oisu/ti+XpNhYVMWRKSLHk=;
 b=C1nVdwXwOePJ9XP8DWvbpLE2pzhklHAnNuuRpgtgjYL8Xsmh3y5SfySgwJOPqttpbp
 MCnbD7OcGvhk2bkFRItb12lhdZ0IWQ9Xi0HcEPtmHj/KWoGxV+h4To5lsbhm3zUlMvP4
 Jkk1UDt0IsXtifSEdrf5Fa/zNwV0kVa9GtmK77XbrD+HI8S4QMpy01iRQUXuT7EU1+mV
 L9quN1Oannna13dcgpiU3l2/Zl8GGg/fZfsd8+0cSivvOH3kvJjbgB108Yeb5jamw5Vn
 mLwDOptZYizk17cj6AbrFzsoC4dS5hA7OcG7A6Dcdcvms0xdohcKTwkALgu3HTxFsmd4
 ywcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIxZNIg4neVn6W6vLt4bvjoEd8M9pHlSRBo/6IfY+lVwZd/BgQZxdSvEVBi4q58WgUs1nLgpjk2ao=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDM974wpjSiNL1cQOfT+afTqv7xzbM8SijJljqR/MIk79onytP
 H8W94CQFHAkliyDDRz4nQXX/dC9JlBTP7J01tH7eLFywDMSyFmAhhmRvHVwuTMoYsWO4gjm96tG
 ZoxUzuGOM4dpTfy6BXacxn//AULFcXiTyqu9SgJUCtSUQI6qFeKqsjG/2d9c+UOhe3j8=
X-Gm-Gg: ASbGncu9CNigLkjFkOIkgjcgrHyxQGrIGUbRSjJWwsow+i83Zyat+7suZC6nXbaiB9m
 3xg/6os1thAiWnSmsOLgTrqET/b8bvYJuiUOgedLGwsQcjxFBqBkQmiL7zGycZZbaZmis1hC8Zn
 uJqpGSnfaD4Woz70actiSMY62GeGRC66jl0evk9/YZ8evMYjbG2Y52SvboeGHSOVVqwEjXyNCOx
 zxKlOOgnOmQt1DNYTt9HaHjt/Yx0GegbOXZINt0Z7t72MvsCBAUFG0QRMooLYYt/s6yl+/hoVlC
 UxURHpvx7bbWtBmRLGepEZvp3ZWAuZkpyEY=
X-Received: by 2002:a05:622a:401a:b0:46c:78cc:e53 with SMTP id
 d75a77b69052e-46c78cc0f32mr24138031cf.0.1736428775810; 
 Thu, 09 Jan 2025 05:19:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHe3uxKGrbYLEc68rCffIx6PrIJfHwygB8OQEV7vN9RWdcNYSGKjSw7IYaLbJUpoBaf4Idqfg==
X-Received: by 2002:a05:622a:401a:b0:46c:78cc:e53 with SMTP id
 d75a77b69052e-46c78cc0f32mr24137781cf.0.1736428775411; 
 Thu, 09 Jan 2025 05:19:35 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c905f0c9sm73056566b.19.2025.01.09.05.19.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 05:19:34 -0800 (PST)
Message-ID: <1c27fada-e283-4058-b944-1b49f7e5d1c2@oss.qualcomm.com>
Date: Thu, 9 Jan 2025 14:19:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] arm64: dts: qcom: x1e80100: Add ACD levels for GPU
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250109-gpu-acd-v4-0-08a5efaf4a23@quicinc.com>
 <20250109-gpu-acd-v4-6-08a5efaf4a23@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250109-gpu-acd-v4-6-08a5efaf4a23@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KB7tinGJGxBo4HYcqsbeUYoyJNCoj2Ze
X-Proofpoint-GUID: KB7tinGJGxBo4HYcqsbeUYoyJNCoj2Ze
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 mlxlogscore=677
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090106
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

On 8.01.2025 9:40 PM, Akhil P Oommen wrote:
> Update GPU node to include acd level values.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
