Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0A7C34941
	for <lists+freedreno@lfdr.de>; Wed, 05 Nov 2025 09:51:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14DA310E6E7;
	Wed,  5 Nov 2025 08:51:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MacXn/Ie";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GpBHj+FV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5D5010E6E6
 for <freedreno@lists.freedesktop.org>; Wed,  5 Nov 2025 08:51:42 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A54Y3gf4011388
 for <freedreno@lists.freedesktop.org>; Wed, 5 Nov 2025 08:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 d9izaKi/37YdD7Vt7gQGjGwEAmilLW9eyuUU4XYRPOw=; b=MacXn/IeuGbJuE4j
 wckOCLXMyzABVkYtoQlcbXbl2LnAPJk/bvrxciicyLWj5ArsPqgZIt1W3r8r2eSo
 Wz+Q+IkcH/FCoVOEC8udC1ZMQVyFbeKZmgu1J8Twqdx7vrC4YZQZRStUVdebPLhR
 jjZ0TtnzxIu3jAHHnSGoBQ9acGkb7byqmo/GnwAUhHC49myHK/tl5gecgeWaw0pp
 6wLOJ4M30EGW8jDTRgsszA1EDgJk3eiNZpGqQm/ueBxi5KSHb5XguQqni/Njmgm1
 /bNrJL/2OJOOxt4oR1svKMIPG5SCOVE00lQLSFFuvAhAabS4YtnLmd3tDhi+YP2+
 GVVmMA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7ynwrmky-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 05 Nov 2025 08:51:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b222111167so17901985a.1
 for <freedreno@lists.freedesktop.org>; Wed, 05 Nov 2025 00:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762332701; x=1762937501;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d9izaKi/37YdD7Vt7gQGjGwEAmilLW9eyuUU4XYRPOw=;
 b=GpBHj+FVpVtLD3FftwP07Mb0Md0m9cylBccEeudHKr6NmNtXSNqa1+ADEfho5RdO5s
 7Oy54QZWV8HwTeztdLJQUOlnDu5m+Hlk7qTGucoz2/v4UFmHMjCsyj6FlqJ3dpRVr1b7
 6aBw3we3nJkC339HUCpArQJKBCqyX+2gGlBi5uauYsgH7PrdEb6qshMIo6K+O1ku79ru
 jkem3sZuFlmGvKAsucDloj+zrb+irJ1U8FfKvevFp7Xa1XmzvXZe580Y+RLSiFPeRqlS
 XylkCJWDwSO8zAx4hP8+yjzZaY2PHpuyvOJih1X6tH4UZluKkBd7ybQlk/gWDlMpDNdd
 VdLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762332701; x=1762937501;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d9izaKi/37YdD7Vt7gQGjGwEAmilLW9eyuUU4XYRPOw=;
 b=QcPZ45Y5LM7QWppHG1/oEFhOyUVBV30yPfagcvnXP/Q+7iB5q5M995sKew0pA050We
 mzEzwWK9ttfaBPWDeLmGNs2fKs8fF+oFo13bP9I8z2xZSJlHlcp/E1MUIu8rx5Z/KOzn
 ArWnOa3q0u0SZEJ6OUMYkT9oRN1v1Tr05yM4B1s2p5HkQ1nQrpgNfEzcmhzyiPNq5ti1
 1elOWCNwVdDNAxnHL9RuF/1Cfm9njv7fJCKxanGEDF1mdy3oH6tmB48p5PrLeiCs3Kce
 SvuPuflqItuqup6ZY8Z5mirmSanDPTfA8Bq7LzyhjK3XdIdQmgDqjBXS3nn34qUv01pM
 jW+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkOgglTaTyj1Q8KSMVrmKCuG5zGbwAJ2quiHaIiAlqjeRYD23aKvML5l9U2rN3wGeMQ7gflPmm2HY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRurf7Wf0aCyMhLbLq2lEJ6V2g2E8sgJMPAAV6ggmEPpKFZPO4
 5v+36H619Sz7yywqspTpJD/rlMpNn2uYdkD7PMdVqgibVb0o9RrB/zEBnsVGvLY3gHnd/1Nt4uD
 nRSR6RPabN96XpDLNMmpnSfIcmIRgY0W33mIGSyO9V3sT7fmEhPoPQD1gm1cDsaJUlvxmuzs=
X-Gm-Gg: ASbGnctIZunT1+6XJogiaE1LWVq6FnJ6BannDVIRiB3CkFfxaoOGCMQhqKY/4BMS6ob
 jSXn8Btwgv83Y3zxGe2DJjFKyNTldNtKH5YmTZLRpIA05P2QGxWLzsOjTUaSuk6eT1myX5lOMki
 cVjXfsBOnSQTJj9+qeKDV47/wLy0F9aO4VowYXSgWP17cof598vBuKPH4G5KsKJLREv3Z5U7HVi
 wi9cG4Wmb81FLvguSHg9Vi99UMEHvvOovGXi0/Cg+f2rcj10zeRy3r0trjN3RvRrSWu/DFjsk2U
 UTnTPjCRgg8Kc/q/SPWxdgqMp8rh6BdysIIS+oMUbdZyRqFoNWgvJVDWhOWGeNT6kNtLewPu+i+
 FSI6ghZrm00obBniOplFzhlAIFwf7T9RbHirX0dALphpPnzjllzpIV4fN
X-Received: by 2002:a05:622a:1a9f:b0:4ed:4369:f3c5 with SMTP id
 d75a77b69052e-4ed725ee834mr21592651cf.12.1762332701116; 
 Wed, 05 Nov 2025 00:51:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8BF9xVY6+n2uyxJUIST3H7zllQ3FZVT76UKK8QHLabE8qTZfJdc6qVuYCZ3/l7BmrDK1mmA==
X-Received: by 2002:a05:622a:1a9f:b0:4ed:4369:f3c5 with SMTP id
 d75a77b69052e-4ed725ee834mr21592561cf.12.1762332700558; 
 Wed, 05 Nov 2025 00:51:40 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-640e6a5c773sm4092065a12.18.2025.11.05.00.51.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Nov 2025 00:51:40 -0800 (PST)
Message-ID: <40bde143-fc3c-41b0-8861-9c856d52bc8d@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 09:51:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add Akhil as a reviewer for the Adreno driver
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20251104220245.240480-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251104220245.240480-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA2NSBTYWx0ZWRfX/50MkQTUBpcY
 wYwsTjK9Yv9swYoKMT4rN3RBpSVrCuJUufVVmyc7fEdftay8zgbM481hKrKphhQn8MPO0pE0wqH
 lD6uKzJfMDyMCHaJSl61ruky2RBaJ56AwoK6Cb12SNh6Mm1QM86LlyFPOcjupn2C6XX/1gOS+nh
 Or4YVLRa/zwR8+1wXtvy40RFo7niK8V1kjkOdM+8wCJkyCXk64bBhS6S+3Ra9+nv+F1obTR+z1O
 czzz6N7XL+8yAB/TbOZlS5b2BaOue3Dp7foShRNcmAwoANp48YfqbwcLmW2PJ3fCacyYHovrOuh
 AN8XsetqGc3CLhsMy6a/Or+M4rM5/HY6nbVgRwzKWI5ii/52kdWOT/rkG6BaKH7SNF/JS4DFc15
 sYbyIu7Yv8O2QCiTqA1/lrhsIWNtpw==
X-Proofpoint-ORIG-GUID: FlghTum8itFaPlKXS7h18P9TWUUrGmyn
X-Proofpoint-GUID: FlghTum8itFaPlKXS7h18P9TWUUrGmyn
X-Authority-Analysis: v=2.4 cv=IpETsb/g c=1 sm=1 tr=0 ts=690b101d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=V8cJkdWAq56nonIdhLQA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_03,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050065
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

On 11/4/25 11:02 PM, Rob Clark wrote:
> Akhil should be getting tagged to review GPU patches.
> 
> Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

About time!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
