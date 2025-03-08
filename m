Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 581F1A57C8B
	for <lists+freedreno@lfdr.de>; Sat,  8 Mar 2025 18:50:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB09510E074;
	Sat,  8 Mar 2025 17:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bp8AdKXK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (unknown [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E9D10E219
 for <freedreno@lists.freedesktop.org>; Sat,  8 Mar 2025 17:50:29 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 528AeeCG018148
 for <freedreno@lists.freedesktop.org>; Sat, 8 Mar 2025 17:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zj9BnuPodZObJbGZ4wO29xgzIU45v7SD9LP2K3bAeJc=; b=bp8AdKXKCQU0aZ+z
 PXGOaa0Y9Js0wMBIgch4E82UVeQPjB/LSmoIQwEVkoHq0QFZc4sq2BVX1BMXvR3O
 Ol2/jPgN8zedvuw5Mfa9En87qOZL4kWW+tMY//qZJx3/VjJzerFTUQPElWzCEpBa
 sICvlOE2rvqDzp6RF7C8snMchafCHDzkteSsYHE+BqZzROI8VUTjoKnxOAE3HENz
 XpYV4pU6ajPwS94hWnfb7JZvVo8uCCjAc1pmvogjSmcmSUxy1aYAXiYlKCyGMi+T
 BZq7mZLqLSTIU4xiTHjuMVmul2fS+V0sp1rqtGqfESolodSaHhzebSvd4mDdz19g
 U1Dbag==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ewpgwpc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 08 Mar 2025 17:50:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e906c422a9so3913006d6.2
 for <freedreno@lists.freedesktop.org>; Sat, 08 Mar 2025 09:50:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741456218; x=1742061018;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zj9BnuPodZObJbGZ4wO29xgzIU45v7SD9LP2K3bAeJc=;
 b=SXPiGKzvD1Dckb+Efe8W5RdkqO0YR/ZuzBEUpiO8YEfD9qf+ietLSuKEUW/GLXFH/y
 UEGQP88IfqI3JDuVrIISu0DvgJ1x/rfoWXz4iJS2EFCIr6hNy9uS8aZrbvyS96ZcScFz
 E4aDs4c3dMKuKlcS2G0wT1MU5xA+493nQW9FdR+MdLJ0kmoKejBMIYHYRgez2e3Vn00O
 iXC+Fsn09HoLA3R5JbNzCuem4+26fU7d90vjTEbYocgXRO+GkaafvCfPobarESvT7sTN
 S0FeijJsxkVpEktSamgUG7cMFu9oBaxqh9mIUyHmjQ2VA8XXxkAYEemmkMiaQSMLYbl0
 c9Ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCdWr10ku2T5blwnA9xU6X3a4SzL52iGxtf0myVWQXmMbGWRTzA6Kq/fjFa7Htm+OWIH2nKv6qhGc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzwg3jqr7UzHxab/TC6CkYlWNPVlieWJec0fXh3gXSbCMKdlQSp
 J8gGWSgk0pOwbVwQ8i9M/9+FTiKiq6WzH0CxTzb5DM3CKSOYSbtm6FWQYVEEwITcGKYgQlfdHzZ
 RQ5fhoS7NEeuLi/zogl5E1ptYH1rKCP1slKQj7bdkm+UlroT9SwsIzXYvkPHFWHghTmc=
X-Gm-Gg: ASbGncv+VSOY3PwCNuDiFe1BTzhI+30TgtrLtKXk+V934li4XwkBk2YbI7lccLv1Pyq
 DtQ8N1DcI6qxzpaHvsSEkDgEnevEeMoZC5QSl1i2CDdS1xxVNRfXe00rCvgtvzXdPILAsu/O0XS
 J2nRk8ZWMpRpcQUbp1oqe9AfbMMUP2j1WrFj+fZNEtC9+dUiHwDgrWOSH4lSt6EWZKlXPFtMv1a
 yqpMiuG5bv+USvf6iMZ7aXA/jfiM8zZxSvz7/IgnyX/YVBl7Lr/X+nTTYe0fBjr7NjeBmfeQQoH
 SPVoxu1dfZcYrAnubpHwWUnvdO0Bqp27yhWad+qZd76D4f6hmN0yHenJtsUgzPI7AP7cVw==
X-Received: by 2002:a05:6214:d88:b0:6e8:fa58:85fc with SMTP id
 6a1803df08f44-6e908ca70f5mr20078226d6.3.1741456217898; 
 Sat, 08 Mar 2025 09:50:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkXMzgQacIMxKsPPQ0qqQUPmgYGnLd1EMdHSa1p+AZWWj27YmK4io2DsVwwuxR16lQY4gJ9w==
X-Received: by 2002:a05:6214:d88:b0:6e8:fa58:85fc with SMTP id
 6a1803df08f44-6e908ca70f5mr20078086d6.3.1741456217568; 
 Sat, 08 Mar 2025 09:50:17 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac23988b64asm462789466b.155.2025.03.08.09.50.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Mar 2025 09:50:17 -0800 (PST)
Message-ID: <d2db3fc1-3889-4718-a905-9dba892be251@oss.qualcomm.com>
Date: Sat, 8 Mar 2025 18:50:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] drm/msm/mdp4: use parent_data for LVDS PLL
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
 <20250227-fd-mdp4-lvds-v3-4-c983788987ae@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250227-fd-mdp4-lvds-v3-4-c983788987ae@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lGCaOMnQIv3sTIje_jGPw3VflMuyw062
X-Proofpoint-ORIG-GUID: lGCaOMnQIv3sTIje_jGPw3VflMuyw062
X-Authority-Analysis: v=2.4 cv=C5sTyRP+ c=1 sm=1 tr=0 ts=67cc835b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=f9hqsFba6A7s5isENxwA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-08_07,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=682 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503080137
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

On 27.02.2025 3:25 AM, Dmitry Baryshkov wrote:
> Instead of using .parent_names, use .parent_data, which binds parent
> clocks by using relative names specified in DT in addition to using global
> system clock names.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
