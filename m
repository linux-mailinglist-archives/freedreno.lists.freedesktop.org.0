Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EFDB0F133
	for <lists+freedreno@lfdr.de>; Wed, 23 Jul 2025 13:31:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E7E10E12C;
	Wed, 23 Jul 2025 11:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y1/Q8lel";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0117810E12C
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 11:31:05 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9QQq7011723
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 11:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=LEy+cd4XZeFNsCcKEQ8NGnzC
 xyrPqaqP08OMrM8m9/E=; b=Y1/Q8lelxaYHM9CS8hCLfOfC/sejyZRu/Dxaw2jJ
 RSNy+cchs6J90LtctQBth+U+2BGHsnG49Skhsl2l62LDgYfp6WTbFrMVKwIyuQx2
 5MC/PLU3SIYZz8ViUCBocs3O6sIRYaIdDZO4BMtnrLqiYNHPicHtyseQCyHr/IKK
 DPgyieLj/j4Vxx70j1K57/N4+p2tp34640qRP8X9Rzfk6HgYD4QqI+pyfy0mVVz3
 W3UpLIa5/oVd72s9LENFDcgLx+NH3WOckYKMmblhNdzTPTgOzJp8ze4pl4CxwPxu
 Tcxy1aaowmU0rRAShauvgGZ1P6XFzne/iW4YS0q8yEFuKw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047qcy0e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 11:31:05 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id
 71dfb90a1353d-532e33187c2so1298327e0c.0
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 04:31:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753270264; x=1753875064;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LEy+cd4XZeFNsCcKEQ8NGnzCxyrPqaqP08OMrM8m9/E=;
 b=Z9dyPF4vTbjnTNC14EU+z/SFcfrLTIv4sk4mhyP+gwhuHhDZLAsB8JgQTMr8JcvnhQ
 cD2YP4RkrTrcdIC3cNH0Fda0NZh1aeG5sgSJI4vNKkNI3fvVbUQQdq0rUZvBM95RBBkb
 Z8rjtQLc4aq9lfmiqvq5pgnWu9xESUeAwpsCIUxtbRFInYOTIfwjwoNyEB+dJ6awOWmO
 1egqj+6iaMLUdoocCZNz66k3fqxLzeO8J9ShQWDlm1FN48+J42UmIIkSAFM+Rkn0pdC6
 U8M6EHvCmLy39uk2C+df22ggBQyIs+PYOjBFO8Uf2Shed2g4WCjLRQbQEUvQ22FUB68q
 esRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHBOhDDAtfVIyTmasgTwUCMbL953BXt12DAP2rkafjtgqP8DOc6CCwwf+ohHDY3G56DdNfuHmftWg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIb52vNqqUPzPTXvTCYf0klUnEp8muPpNYF1dQ5nIYr/EhUinS
 zsFIskNCrIG9tCHPz63AwK3Qi8sRykHSAm1pef3EHF038j1+T5IO2//lZRDiR38oaWfxLKt1g8l
 y3VUpYFGkdME6bV9IezNWxWHf05c731zSX3EPpLBhPLw/U1N69S9rMMHIdQCC6nqsb6LyBb8=
X-Gm-Gg: ASbGncuUTRNaOkEU7n4/npCqKNAcePIyIWlmArv+64u6Qiwqfr1cjysm/dNhji9Q67E
 M/ahHALLd/70CXuRee1dPcn/aqBy0GJGnvuOvD4NJsGspthGyvl7okJhqWFU9Qgj+P4pI1IFzwn
 7ZhVT4m+5eUPCaOwKAl2sfDCqfezGHN4VJOff31ngpMii/3ia1kGynfbluLDwoaSfikWDhO67/w
 HQy6eUOYZO7c/SFb1oIiK2Pet/h17M4PpH2hkS0CAduAozV7uoo0WUWhuaiPN7ZjCPa/aimqo6A
 pMl1Bpu0UDn5SrSARF85uT4UYi0B59Z26GQY3Dt9Kr3+j4az11pNDNicd6vCFMcg3eCIhj6pTKi
 VloifcqgAKDz3R/X4Kqu9aagEMHSApqiSvXiFow8gOFMyCFskZQVl
X-Received: by 2002:a05:6102:6d2:b0:4e5:9323:d2b9 with SMTP id
 ada2fe7eead31-4fa14ff205amr839594137.2.1753270264189; 
 Wed, 23 Jul 2025 04:31:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElI+nLaRgSNGVDgEVXqwotYLUYVXhaufngd/MK3e1G8/fbHHtEjIQSDAJaJfnpO2XvBgiojA==
X-Received: by 2002:a05:6102:6d2:b0:4e5:9323:d2b9 with SMTP id
 ada2fe7eead31-4fa14ff205amr839574137.2.1753270263645; 
 Wed, 23 Jul 2025 04:31:03 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31d92160sm2268566e87.162.2025.07.23.04.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 04:31:02 -0700 (PDT)
Date: Wed, 23 Jul 2025 14:31:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: dmitry.baryshkov@linaro.org, linux-kernel@vger.kernel.org,
 tglx@linutronix.de, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH -resend] drm/msm: use dev_fwnode()
Message-ID: <6newddw6tnus7yhzd4d2sin7czbr5x77qdhlxwpjuulnq27jxq@vfntrc6tffit>
References: <20250723055512.1800438-1-jirislaby@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723055512.1800438-1-jirislaby@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA5NyBTYWx0ZWRfX7sA79NNoi0s4
 V6rPUZ+mtY6p+FP8Dznc83Te6dBR+zVnwF3K54f16fh0sfUAWiIyBmUTMCYcruZinXaI24Y8rbM
 eCSlYFnT3ZUgQFu7BC3JN7EI1+Ajh2Q6vZvC7FPSX/a2Zb/rZZJzIb8xAHxG6MXdqKX57jMT3Hf
 EloF88dUvA7fw3e6COBZt8VXo0nRxJXzbE+SLq4+mRqgpPHb1f9HtmQgNQF+MuN4vSL+9yhuvNi
 SdL61rkrCrnEe/2s+Me8y5PSTh4XmWR36I7IV0b3K7n0RetmuCdT2kBQAEZg8ju31QTkwEYnId1
 w3tTS8W6rb9IU41Z1supHAbh9diowSqR4Bl/8SKEa1EukYqWWOo8bSnVx0esuPDNfKPyOIt7Ize
 YefkYi5NtXEEV72ib4kPiBUFaSokSS6nom4bNRYja8sPLdhpsjOlYPUDiVGph2vQCN4059SN
X-Proofpoint-ORIG-GUID: n_5jJLQyZVLT3lO3FSHgSPJ1QsMZsiFn
X-Proofpoint-GUID: n_5jJLQyZVLT3lO3FSHgSPJ1QsMZsiFn
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=6880c7f9 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8
 a=tVI0ZWmoAAAA:8 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=-sS6WOwEsJUFamFQ3l4A:9
 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22 a=TjNXssC_j7lpFel5tvFf:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=789 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230097
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

On Wed, Jul 23, 2025 at 07:55:12AM +0200, Jiri Slaby (SUSE) wrote:
> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
> 
> So use the dev_fwnode() helper.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> 
> ---
> 
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
