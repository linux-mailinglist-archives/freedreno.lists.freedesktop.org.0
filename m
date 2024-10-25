Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5D79B11FA
	for <lists+freedreno@lfdr.de>; Fri, 25 Oct 2024 23:53:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF37110EB8E;
	Fri, 25 Oct 2024 21:53:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LBJrvLIP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7E210EB8E
 for <freedreno@lists.freedesktop.org>; Fri, 25 Oct 2024 21:53:10 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PB69vq016490
 for <freedreno@lists.freedesktop.org>; Fri, 25 Oct 2024 21:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 6GeOWhrjGYCL982yNJxHpDEKNaEsIOQVVRx6HDGXoy8=; b=LBJrvLIPQTOZFtHh
 4hNeIqNAHQljwDqMckAz+j9xzXbFhzs6+Ak+hcga1GzDYihTW6GgQZVwkywHM7M+
 nDn/cPRGIxm5/yWo1T3AmOwPxiGeChnR40h94NiVlRIjqPyD/icXniRsRCuaJXQO
 a4nwrOIqHJYH/DQyK8U4km7EEkqfYwC6A8x9F1ZH5U8cK34waeduC1Q5wAxR126E
 vtZ+r4vTsVnf0c+V09jyS68THiCzNyr3GCSbE32509KGdbTltxuL9iwleH3IlZkX
 NjRsSuiP1zeKt0wmSCsjiGcq1uDn07RsJoid/pejxkNaL7RkS+6HXwPuEiQd+Q3X
 /UWiIA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ga5jsn91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 25 Oct 2024 21:53:09 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6cbe993f230so7696256d6.3
 for <freedreno@lists.freedesktop.org>; Fri, 25 Oct 2024 14:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729893188; x=1730497988;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6GeOWhrjGYCL982yNJxHpDEKNaEsIOQVVRx6HDGXoy8=;
 b=teTZGNS8W/l1zb75i55hB+DRSplNIc18zCWFAxSDtyfJYvGL4cArTjGdS8/ATlbtrb
 SvR0zRexAE2bMzNtu3CbbS1228d6uiSxrfelU4dWBqYfXAaKevrKwht4iODE8GWGPgrp
 fzxCJ4bpnwRp0t7x8IMKxOJ3n3sdLs8GxTNN2eATW9YMAwCsH7u3qpo9nR4nR1jWM/7t
 wzvff3FtybEC7C8/Ob3SOu9VZa//VDi4ozYeYA1KOfGXINHKh43fx7UDyNkCi0cdIy6q
 4ihlMcwluhG9ehCWDi6dWS/whgyECnzEbO0V3snED6Dewdu2rzMHeR1LB5oFPRo3a7FP
 2Cyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmUzP1Uidyq+VppuY1fBmaB91y6tmBTczo8TXt+5iktl+AEZe/Vj2XZYQfibdKvE9lKVAAnXa5wQo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaAn1VP2lScZVIrcfTrT0pz+P96jiDs3B95StsJXh80abTjG3v
 E9Dri3jITgXfKVloaZHqEdIqrc5tq/Wnz2W+eUG18ELD4dO1QrZLZ0YR94azvQ/sVplDIRJ5pnP
 nlFhwzIJAYevxhAmFMqOH0Go3OJpN5Q7FeijTUtBM87gVf9c77ncs7pnexpr+Y0v2fbI=
X-Received: by 2002:a05:6214:19c1:b0:6cb:e7e8:9e88 with SMTP id
 6a1803df08f44-6d185885e9fmr6384226d6.10.1729893188124; 
 Fri, 25 Oct 2024 14:53:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEslwHHx6dighOzv1/9OBtgqY0Tn3FagIVg8QIn1ToYUExPrzN5qxZ9a8b/HkXDPpIXqYsBHA==
X-Received: by 2002:a05:6214:19c1:b0:6cb:e7e8:9e88 with SMTP id
 6a1803df08f44-6d185885e9fmr6384016d6.10.1729893187795; 
 Fri, 25 Oct 2024 14:53:07 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f29744esm110069366b.130.2024.10.25.14.53.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Oct 2024 14:53:07 -0700 (PDT)
Message-ID: <2cf6ca44-3a7c-4561-91db-5493414d61ec@oss.qualcomm.com>
Date: Fri, 25 Oct 2024 23:53:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8550: correct MDSS interconnects
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 stable@kernel.org
References: <20241008-fix-sm8x50-mdp-icc-v1-0-77ffd361b8de@linaro.org>
 <20241008-fix-sm8x50-mdp-icc-v1-1-77ffd361b8de@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241008-fix-sm8x50-mdp-icc-v1-1-77ffd361b8de@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Yz7BnIAJSMdmhyqlw-PVc5WuNcxzPsGB
X-Proofpoint-GUID: Yz7BnIAJSMdmhyqlw-PVc5WuNcxzPsGB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 mlxlogscore=768 malwarescore=0 clxscore=1015
 priorityscore=1501 adultscore=0 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410250169
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

On 8.10.2024 1:36 AM, Dmitry Baryshkov wrote:
> SM8550 lists two interconnects for the display subsystem, mdp0-mem
> (between MDP and LLCC) and mdp1-mem (between LLCC and EBI, memory).
> The second interconnect is a misuse. mdpN-mem paths should be used for
> several outboud MDP interconnects rather than the path between LLCC and
> memory. This kind of misuse can result in bandwidth underflows, possibly
> degradating picture quality as the required memory bandwidth is divided

degrading

> between all mdpN-mem paths (and LLCC-EBI should not be a part of such
> division).

I think it's just for power savings, but maybe Abhinav would know
better

Konrad
