Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D16D23A63
	for <lists+freedreno@lfdr.de>; Thu, 15 Jan 2026 10:42:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB2E610E72B;
	Thu, 15 Jan 2026 09:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OhnnM2dq";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dk4Rp3DB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB8610E72B
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:42:34 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6fxQb1991708
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 J0OOfu6f5Nk1cXvMYkdgiKPZusVb1yTTCdfQuLtoapU=; b=OhnnM2dqLL9vYjc2
 7N5rMoLad0asDbhs3eE8WvkeJOpDHI651W6tHUoBvpaufP3SFKYEgcNo+qzhFNrv
 It4js1yGN3QjFuscnhP/rbMRqEtNqNNU52gGOQfyOdExum+rJtiVW5AKfQnJ8gof
 8eVIogfBS4W6NYE9rlSA68M6P/ykj9NRCTezXwL57d73HW1ATey5T5Oeens8imoy
 xYWTmXKZXAOjh3j/MzGvlfmg23s4YbfnynHyBXrMavT5s/a/WapK3aqTYpq+X1Ay
 C/FL0eXY3+K3sUjL3jelaoQWRqhhTdyZJrx9I5+xX/LJGCIwZGS7xfLf4uEEHQvI
 5Wi58A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbdbuen0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:42:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c52f07fbd0so318502385a.2
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 01:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768470153; x=1769074953;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J0OOfu6f5Nk1cXvMYkdgiKPZusVb1yTTCdfQuLtoapU=;
 b=dk4Rp3DBAVJ9SCWwaUrZHNOtPO3LPqQ/a9SpOkX3k+BsRZWOYEsy01qirl6JB6M/PT
 W9ZticWXV8c87doqbbPy5RKUN5jFwioz/ULNocf3Nv6TKPt/+1colLvhpQPvPCP3H7W2
 CTYeaBdjPN16WNn8E0Ny3bG6rlOkgDbpHyWxNEgSyqPJB1DqugPTbNIO7teiO9inEIhI
 E6/B4FXUUpH9aBBgK1RtVymG7GpQWq1r0F/Tgh4pkNj2826FlxnXhrzsLPkoJasRlG0H
 a5jCdYJaRhIRJWwa+5SLMgSuM+bL3MPIyk8xcz6u11mp02rE9BTnU7+3d3fvJmDqacRH
 M9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768470153; x=1769074953;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J0OOfu6f5Nk1cXvMYkdgiKPZusVb1yTTCdfQuLtoapU=;
 b=M2lPuqGKC+7Jgg7AvINh95/2t4IRF+MTw3YPjnmXOjmJPcnTaO/trkYvGPVHkAcSBm
 85fGY4xp23YGNrXyFe5UjXReRjWqnFWKgbobAJArCEA+rSmOo9Ta3dNUmOFTPvPbPQ1+
 lMX5/oZh11hR2nHY38HJBmRtyoPvH8YeGsvmxLFQGAj7Gqj0EvfneSxBkMvhYTKIgF4q
 wSp7gvdW25pbxzfHuKhRr4oapLwxmvdeoB6eTs+C+A1tQzsj6IXuunQ7UraZBv43XUCR
 MACDY9OHKMcKSCWRxrh/v128M03yBV2UBO4i1Pr0FLWgBCYZ12SSWOcm8wcgt8P5W8ke
 5wLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1lLJBqTLo/ugz2n0FOXX/nQFZlX7lIHsCIKNcfyGoQ+f0nb3JhBNgNOxbPjFs31Us/lWLP++rCqY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsP4dLEKXlAdyKWDuiKLwgC9GSr+ZfPbLFimX2fPKgCDeMsyjF
 M2Dbw3TnKUGfMqUxRLnAvgpwDTIvFl//aV2+L5pETOTGGy9AJ9hJEQ5aToK/3TY8lbq5jTeAEo2
 JRvb675SGa5qDIMlhY5ewVet6tdx4GpXp+cUqsnnXUKZd0nGEt6toTGhehxPlJ/nsFQ9lTu0=
X-Gm-Gg: AY/fxX5kPr2Ac4Br9XDbwoGHFzRbMHs3TB+xRk2MVSg0FJucwNJmlAkqnZhin5MGIBS
 0WU56dvAhdAC6ysyN/ntEi38lCidox3LFV1fE+LYCSMhbZXNwHKEf4gTSVuujffmwWJXWjzLvZF
 a3mB7YUAIP/jYof+1oglUTSCxmVYItTNGTp2RnVPZePaiBkQ/U89PFdTMEJkUtYX6WjMPeIlvbD
 VbHKDMfb1HGQdxIXiVD6wksoJ7KExf8TEGLdvMtNOr8noqyXYACBTYnbhXGnu+i2RqKhZE1L/Nn
 upCyCsIdsDRzie/CNBVv0Kj30rvm4jKKvCGOjuUaboGlv1r6iLs+VvuieKE1DSgMyepwpMjQ+ey
 Zw+gpf5Pux1Oq+BKgIeEoTlY9KplXjBBel+TbcsavJ2XANPjVKwfSC9Rni7lLQc8e2cFGipFXwx
 IMKpDi
X-Received: by 2002:a05:620a:4082:b0:8bb:7e56:f204 with SMTP id
 af79cd13be357-8c52fb56c2dmr804140285a.20.1768470152974; 
 Thu, 15 Jan 2026 01:42:32 -0800 (PST)
X-Received: by 2002:a05:620a:4082:b0:8bb:7e56:f204 with SMTP id
 af79cd13be357-8c52fb56c2dmr804137285a.20.1768470152423; 
 Thu, 15 Jan 2026 01:42:32 -0800 (PST)
Received: from [192.168.1.188] (87-92-245-163.rev.dnainternet.fi.
 [87.92.245.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6541209cd87sm1963901a12.35.2026.01.15.01.42.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 01:42:31 -0800 (PST)
Message-ID: <22a3ab11-9151-41cf-a0f2-8509abbd3d27@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 11:42:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] drm/msm/dp: Drop EV_USER_NOTIFICATION
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
 <20260115-hpd-refactor-v3-5-08e2f3bcd2e0@oss.qualcomm.com>
 <17990836-4278-4c5b-afa4-eb631930ba2a@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <17990836-4278-4c5b-afa4-eb631930ba2a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NvncssdJ c=1 sm=1 tr=0 ts=6968b689 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+WgfKLcscl3VAWRHYO56eA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3lO4ytp0PBcW_CA4VZMA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: -vvqOuU8gtT3fkwlUiZI1n7Lkxhd0u4N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NiBTYWx0ZWRfX19zDm11TmfRj
 JcywIXm3/N6KnfKR8ps3U6rbRoEUnoMHAyP0LngbLRJQl1dtx/5/AQWS8ksymMJAEiVuRpG985K
 TbRHo4QewU0finNnSnky1qZwaV7LBCke6CbLJBkfe7vFERLSgUJsMcPUIfl9Msbr52+tRquLvDE
 XOvWeT+3f3ELgUufTQD1KMHrWjETr/Hr0iUHrzB0qbqWvUF4LGljOOi2YaQ/4Qj3kHaugq+ViRS
 4BmihlUfSSj3noMa9oQXFV4iSJROgfpYpkXfC5j+N1SRVR/kDe+mrIOIAtvH6IvYqYhDF/n31hP
 op506UTaHd5qbAGRveLnpKWnj/whWjrZLBoKbJYeEFylzZXejxOCZZM/sOc4VEdMQ+DGRbq8/6B
 UzsUbDOROVgljI7FnCK6YpS0NRKH+dlVoMTm2ZG+81mAH700YoO9WbZhR1YIqQA8UULWkGOcLl3
 wJ3Wx54ajslHQ8luTlQ==
X-Proofpoint-GUID: -vvqOuU8gtT3fkwlUiZI1n7Lkxhd0u4N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150066
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



On 15/01/2026 11:41, Konrad Dybcio wrote:
> On 1/15/26 8:29 AM, Dmitry Baryshkov wrote:
>> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>
>> Currently, we queue an event for signalling HPD connect/disconnect. This
>> can mean a delay in plug/unplug handling and notifying DRM core when a
>> hotplug happens.
>>
>> Drop EV_USER_NOTIFICATION and signal the IRQ event as part of hotplug
>> handling.
> 
> IIUC, the drm_helper_hpd_irq_event() -> drm_bridge_hpd_notify() change
> also prevents us from checking *all* connectors if we get *any* HPD?

_unnecessarily_ checking all connectors if we know that HPD was here.

-- 
With best wishes
Dmitry

