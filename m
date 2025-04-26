Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C204AA9D79D
	for <lists+freedreno@lfdr.de>; Sat, 26 Apr 2025 07:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F215610E050;
	Sat, 26 Apr 2025 05:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UwiPqJcW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B64710E20F
 for <freedreno@lists.freedesktop.org>; Sat, 26 Apr 2025 05:06:48 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q0iCYt024812
 for <freedreno@lists.freedesktop.org>; Sat, 26 Apr 2025 05:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=eIL0w0SaX4fEgbdtMZSS99AU
 nD4HN81VW+RR9ZFL48M=; b=UwiPqJcWeRfXKGZLlT0agSw339wTDg3PCCVj8LQH
 yA5RINtNoHEdSVM1JsHflF+FPX3yiiaGkso7Zz9lz09vSwtO79HJQ50Qh+g8nZX/
 vHhrHJbs23P3OlGSTxLMtHWF3WGTZXU7YZ+MxbgrRvJBuW8D/jiwHBILVxoWvCx6
 oLpQT9fRf9hSZrYbtlFjcNDFg9gAQ7yGtliUCQzzTopF8pV5qpbYkxAYVK41hg2m
 SyXa3VebwcVirsIOEWrc4NQEOOZMmb+yzcfK/nWpZla4JSm/dGtOQbiMnTkGpME3
 T4poN4r+p477qwePiZpI2s5rXEEQNpwZ569C0nlIG8SxBw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468n6j8dqv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 26 Apr 2025 05:06:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5bb68b386so843732885a.3
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 22:06:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745644006; x=1746248806;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eIL0w0SaX4fEgbdtMZSS99AUnD4HN81VW+RR9ZFL48M=;
 b=pgFA3srYbYJrO/FeGMjGl9X/unrMCQRpkgn8dOK4Yyw8SSgetPN0w9Bvszh/pCSbtL
 kH6RlAaTEg4Ce2T697pA6dbJU1+1uSyWAKbr/83nlJLmUgBimxZYelch2E7DJ4ntKnEe
 SdcBuFijXHIjHQh9ADfoJL35flMkntvC5JrkQGR8eFmMV9x3MyQ+VHageWwn8B31FcrQ
 Qv11A4fBQ5qZeEq3e1pP98GkA3U6/uI/jRJ97JYQVlajWiPT1eHN4kIQaUR1Fj4RVDtD
 u2bwaK7ZejmCEDOULBCvf9TazlCA3NQcI9yu32JYDNWCZXvRBjO6/8+NkOu0C6p7moeS
 d1HA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyJQfzA4LPUyaxHCbbse6GvSDTMo6a5rfatG6n5+OoYQadioDCNBHmSSgCOKu3hhQCUMHm6oqaQHs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcNxbFR949stXv6hnpTlMonZz5UsVoe+Ctha44vcogl+bk3G83
 w+M1yF0zcW3evR4WOvNY+jM5wK6v3YPcdsB7BA4OnBHpEv/GLTfC5oWr/ur068yOam+X5YR7ie0
 j3LcG/ZPiGdzfYn2kSYukY0T3exqQ0horSmk3mRkFNNnCEnGRsWcYAaslTAkP9VSM194=
X-Gm-Gg: ASbGnct45o6ZlSxYo0r+M9qE9u0GO3TUAKlyt0AHtUvg973lABooIcLYulJZdw3Jmav
 XjUQSCC6YCQHT8R/vbkvJp9uxub1m0vyMZ2ebu250aiEC1KhMhq3VjLEVmS6vSuZPRDP95wSA/g
 C+abTDFIL1K65poyQwoi22TsNvEHVQEufUqUP5ZdR5cagIHoffHHcVIhpR6LcrAg0Mhm6AzJ0Mb
 tPCNEJ2+WsQaSCQRXzegixBiM2Q7fclHRaH5eR/lXCJU45UADJm/BcCXm31y8t3Y/HHQxxgJWSm
 lIPUplqqAIbfiDgrBrPXi/s0q0mMY+cvyhzNTYLyARDVO2SiVaVblFRfpDYUveUU3C86xp92VQs
 =
X-Received: by 2002:a05:620a:2894:b0:7c5:5e05:df33 with SMTP id
 af79cd13be357-7c9668cda1cmr346617185a.51.1745644006437; 
 Fri, 25 Apr 2025 22:06:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMaVXLId8fuUgq9yIofTuCxPmggQOFvjAUGTOfOuo8GXCozhFMNKAnbZiG2Wbb5ZGjE45ggQ==
X-Received: by 2002:a05:620a:2894:b0:7c5:5e05:df33 with SMTP id
 af79cd13be357-7c9668cda1cmr346614185a.51.1745644006052; 
 Fri, 25 Apr 2025 22:06:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7ccb7bf9sm837712e87.215.2025.04.25.22.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 22:06:45 -0700 (PDT)
Date: Sat, 26 Apr 2025 08:06:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: msm: qcom,mdss: Document
 interconnect paths
Message-ID: <cmmongeaqwfsfnhpmwdsvozhjzkbdqncktiski4jvqgn5sjmsj@2lw4vesrcwjc>
References: <20250420-msm8953-interconnect-v2-0-828715dcb674@lucaweiss.eu>
 <20250420-msm8953-interconnect-v2-1-828715dcb674@lucaweiss.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420-msm8953-interconnect-v2-1-828715dcb674@lucaweiss.eu>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDAzMCBTYWx0ZWRfX/BpOXxw0wsQt
 Zd3pQOhHsBSZ/m90STaCZBA/25uSpR53dvpgsu2Dcw4v01xr/NwA5IBHHzSW47LfOgv9JNvKkDm
 rcO6oV2gu4L9fXqFiD4FlKOVhEkurKY07xYhEfaQzDFD8kg1avM/Ee59fkE7Jy5FPL47yRJoVgt
 Bba1YBNan43Vg4tVPUVPtg2BwnKDVbfBSUEY8Vkb1LqzekU+Xn5ND0HSUMPTzWva/+7Wrw7k+8X
 kJrvstbJDNhhvVMcLSLvheF9lhYifeDmZDZA1uxM2K02sB+VTWw3QUQXOSZTkche1Su5FguyYDU
 eSKG2f+cgYIF3VfPZMxPdffm2RTppMmxvh0X3Hml8m3pE0Y69Tx1orhoCywjWbtYowQS3PjdRs5
 NWp6imjSnmUpzIo0xGD/Fp6fZojE/c5/SlBp/bhu/tT94cNJb83UKLu8k90kcb3R1t8tL66B
X-Proofpoint-GUID: r9kQZy5mcBdE5YvFC2Axn3a8AIX2NtLD
X-Proofpoint-ORIG-GUID: r9kQZy5mcBdE5YvFC2Axn3a8AIX2NtLD
X-Authority-Analysis: v=2.4 cv=C8fpyRP+ c=1 sm=1 tr=0 ts=680c69e7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8
 a=z5yIEXyMNdJ1grE4PEwA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260030
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

On Sun, Apr 20, 2025 at 05:12:43PM +0200, Luca Weiss wrote:
> Document two interconnect paths found on the MDSS on MSM8953.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
> There's also some interconnect paths defined in the mdp5 schema, both
> drivers accept it. Newer mdss schemas seem to prefer mdp0-mem + cpu-cfg
> in the mdss schema instead of in the dpu subnode. Since there's no
> cpu-cfg defined with mdp5, I've added these paths here.
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
