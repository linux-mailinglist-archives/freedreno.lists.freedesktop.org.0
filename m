Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B63DC46088
	for <lists+freedreno@lfdr.de>; Mon, 10 Nov 2025 11:47:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5F210E2BB;
	Mon, 10 Nov 2025 10:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bRR5fElt";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U0B/hisC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FAF110E2BB
 for <freedreno@lists.freedesktop.org>; Mon, 10 Nov 2025 10:47:08 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AA7h25j2860605
 for <freedreno@lists.freedesktop.org>; Mon, 10 Nov 2025 10:47:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cBJVNfik5OiCeMMLHOumoYf4lo5WTFo4GRQQQ/riu2k=; b=bRR5fEltyaQ5HPAz
 Wmj2NCLsxpW+BbxhoGgmu7VRuHespbktdXn3g0KRMdigp5cXpK3jbg+hzcyYqdaN
 VragxiCG3MUVqHfEZa0/a4HmlUc70SlMHHy6ClkENRP8umVJzaiD5uMv0jq4hNTH
 hu7ABM3UGgi+jY9AP21cAhkpuXwq2GIu1Hab/jPc4xv1X+j/SOK0kuy23oewlPmp
 OM7NsW5S3BPhZeFEpYTaDw0HVIce4sM2RxChQMLR/zO8QziFelLpZoHc9AF1c0+1
 PWJCK0vX/PmQH9P3sfYxQz+/Img1wReVi4l/TqKdLSRKiWfUwNvm7qKYy3nIcyJ6
 5bge+g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abbwe0n3u-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 10 Nov 2025 10:47:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7a432101881so5227535b3a.0
 for <freedreno@lists.freedesktop.org>; Mon, 10 Nov 2025 02:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762771626; x=1763376426;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cBJVNfik5OiCeMMLHOumoYf4lo5WTFo4GRQQQ/riu2k=;
 b=U0B/hisCwTsjVa7M9jI2L0EscxuSNNWvHKytJwiGo+iuLMOuw0av14hU9edAkXW5Xp
 Y/f+Q+qdXDnNNvm0575KMkfsVqRlTULppESlaHuRG28vpiWq+MDGuZ/hFRqUqIa5bZwV
 S19xjizgrnOJurVJ+zZzHWQXfsez8nIfNKPtUUlQQixXfQCxFJKUcAT4Srx72sF0PBSB
 BhN/4lfcuzRLAj9eoiovq4X0cvcg8w8QNVqP1VxMGlBdivn/+rX9kEbLzJR+ghOHeczF
 AlAB70DBVpBKYmt2MHnYaJ9XRNlhGS6dTARl8slLQBQiM2dUvrAJMDWhtBK6lwlgJzJK
 E+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762771626; x=1763376426;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cBJVNfik5OiCeMMLHOumoYf4lo5WTFo4GRQQQ/riu2k=;
 b=JDqmJoNy24REwQl8JM+gGtwgbejBVXNoyfpsCYVxkPvduaToE7ZYEyWoq4I2i+MbI1
 z871RnW01S/3U6ws/aVgOObzIV8mHIYZWksui6f7BpB3+Uyis1cSBcJOiG4aaVM8M01g
 OxsCnh8EB6qvhVmif5+A8fmUhC9OA8Nr7aRP4FbumPnf5YeWR3w3+kJ6V7a51lXAQvwI
 LP8Fu5O0dlpAlq8nYgIkSTwFmsDoH+pthzKmnPSkQuINrIMbFVZ1hia5n9H/rwWCwvX7
 dVjNgfGXir7VCqgg2tUfIrj35Ir1+oH0K8VliJPC04IZ17b+W+Kbftx7hhPzukP8exRN
 m9WQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJ8WrqCe0TmkaLw1JSxIToYZv62ZHcPKDdDqONidMpjsg74tOk46BuQfWfzzcSaTyFh6zPTzdXcZQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yze7nH+ezZtoKMLo2iDhLWVqTOuHWXn9NnUW7ZVYaY8z4nsQrV6
 BGPZlYXOz+q1ZOQMhIdQeLyEmXcnuSEPiRYFY9Yzy0uqhe0yuR3BdVfD600o7VzlB6DfMAwp7X6
 QeY03f0N1rxu1kH9E7FGJkNcNQCBtSsTMQbjkW9G6tzf5xKePJfpzwD15Pq3EEKzrXuKXono=
X-Gm-Gg: ASbGncvfM9F2GmQRGHLCArog749poq51uq2HtWfDN94k6nD43Lizhx9VpE84uVNi+CW
 XkObR/VYCfq3+FPPJPEFThmt2gNQDazHcw92Pc67WyXGQFwW3lofDMZUKry5xqEVH8YOwDdhogw
 qO6uhfhBQBvCKj4D5O0M7qxM9JVhHMgxzzSHRkgegER8TCUelzJCKD+iBg3Zl4Y+T3p7KlxxXGI
 0u+oHaklYdBLoU5JEopcuq8oPTsL2bEIUaDfQQLs2wcyp3AaEUw7JlrvFyQpHWaQCPGM5G/osz+
 iU/cE7Hk+dXYWltQ9aBP9YjqIsL8bRziKJCQywCyTPtSQKYZ7C0A48TJdf+7ikgii0Idc12OiTT
 UNEhEQGiUBmMUquoEPbQeeg==
X-Received: by 2002:a05:6a00:2315:b0:7a2:7d23:f6df with SMTP id
 d2e1a72fcca58-7b225ac3be3mr9947256b3a.7.1762771626241; 
 Mon, 10 Nov 2025 02:47:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4vJOPjqb72Lut8GdThOc2xoDZ3DeILcxOCSGvZKHBENufhfY65hftt13Ag1lzGMrSMfn2JQ==
X-Received: by 2002:a05:6a00:2315:b0:7a2:7d23:f6df with SMTP id
 d2e1a72fcca58-7b225ac3be3mr9947206b3a.7.1762771625715; 
 Mon, 10 Nov 2025 02:47:05 -0800 (PST)
Received: from [10.204.104.20] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7b0cc76c0e8sm11310969b3a.52.2025.11.10.02.46.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 02:47:05 -0800 (PST)
Message-ID: <0deaf045-4728-47da-8e1a-48a50d035f91@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 16:16:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] Support for Adreno 612 GPU - Respin
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <quic_jiezh@quicinc.com>, Jie Zhang <jie.zhang@oss.qualcomm.com>,
 Qingqing Zhou <quic_qqzhou@quicinc.com>
References: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
 <83cafa2f-8fc3-4506-8987-1b5e10d8eff6@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <83cafa2f-8fc3-4506-8987-1b5e10d8eff6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: z7-uVUw-gjt_3DebpHFU7YLTHwITKC8H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA5NCBTYWx0ZWRfX5thikBdfT0g4
 9rrpg/PhqXPcSUMXaxG1lzAl2Xcvf+LJ4rDnYs8tYMRJsacp50M5mttDZZJq1QCof1Xk8yNsua1
 12V7osVyXruz8TYW9nuODZWbGiQs6UJqysm41k7AK+xNLVcaPvxRwvVWIrvPLBbD80PygZ1nhtu
 oXThqVpevEf515avia0SXgC7qQYZ+HgBa6htiYkD+rimKWvCWEbynMrWgLkDPxz2EG81sHWk4bl
 M2ReftAJnqgz/AAU4mKR/T/ymBMBXyF72XexFGTRQS5I6kqeg8kvY1ZtfiiC+zi5CjmZh+emKFZ
 s1MP486+1AP1GSHekjf2WoeFE0EH0OcdrP7ktcnTMZedai9UPtaNm9z3dZCfV6ysZvKq57WKAqF
 YUwDI1h6S2bLpqbXSFkwFvSWCjHPxw==
X-Authority-Analysis: v=2.4 cv=GbEaXAXL c=1 sm=1 tr=0 ts=6911c2ab cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NnskH1bFij-3DXFgURQA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: z7-uVUw-gjt_3DebpHFU7YLTHwITKC8H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0 bulkscore=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100094
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

On 11/7/2025 2:22 PM, Konrad Dybcio wrote:
> On 11/6/25 9:50 PM, Akhil P Oommen wrote:
>> This is a respin of an old series [1] that aimed to add support for
>> Adreno 612 GPU found in SM6150/QCS615 chipsets. In this version, we
>> have consolidated the previously separate series for DT and driver
>> support, along with some significant rework.
> 
> [...]
> 
>> Changes in v2:
>> - Rebased on next-20251105
>> - Fix hwcg configuration (Dan)
>> - Reuse a few gmu-wrapper routines (Konrad)
>> - Split out rgmu dt schema (Krzysztof/Dmitry)
>> - Fixes for GPU dt binding doc (Krzysztof)
>> - Removed VDD_CX from rgmu dt node. Will post a separate series to
>> address the gpucc changes (Konrad)
>> - Fix the reg range size for adreno smmu node and reorder the properties (Konrad)
> 
> The size stayed the same

Weird, I had a fixup commit which updated this. Seems like it was lost
somewhere along the way. :(

Will correct this. Thanks.

-Akhil.

> 
> Konrad

