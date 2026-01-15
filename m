Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C9DD289C0
	for <lists+freedreno@lfdr.de>; Thu, 15 Jan 2026 22:05:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C0310E7C0;
	Thu, 15 Jan 2026 21:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="l13oVhuM";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YmaTpQmt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADB010E7C1
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:55 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FFYMeg1910243
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jC8lA6B0ipWoMHR75M2AQCJx5qPi+JNV6zZXo9VKefg=; b=l13oVhuMfVG9bJJC
 o3w4j4Dcm0fBhXvn/AW1LW9YGKandwyzAVGNoUQ+UDhD4dmAjY+hp07mdC9S1fCk
 tAWdHZRNFtvV8YjYzEPhMhZ2EvOLvKTWgNW7wu/Vj3ofVOrkNnfDrFOo3w6VocS4
 gBQGUxTl4kw1R3etUcDHof9VLHHrRAYtAu9MC0dopweshkNjAeEBUHBBltr4uF8V
 qxVH/iUYv4FDWbYFYtAFXAoW8IgNeVAt6X4YL10bDJjGojxo+i99xmiCeTMn4B0P
 cfur3HRG5GThOS/DIrNEjrXPGtwUx9kpy3RVld6F8THH9cLvG/8H7J42G9pSPFXL
 YkShlQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpxgn1s03-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 21:05:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8823f4666abso34930906d6.0
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 13:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768511153; x=1769115953;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jC8lA6B0ipWoMHR75M2AQCJx5qPi+JNV6zZXo9VKefg=;
 b=YmaTpQmtLlD8VxTE46Jc5PPVSNFGSZsO8AhC7YQHOEoyB3dIG/NcnFTCgqMCDn7uxu
 idWB4yIR7koTYMEvjzlGoXJJ64J1kYQnCQ5XdU5fzECaO/3WoNR+ikqMuVDHiqD9N+mn
 wFjtR/8Q6FGa8PfuAizAiGZMSWN/mGLS4lWoHNr98/UhUAF9dxz/GTm8NPMfG+Ro0V8a
 3bBSVA6STOPXgB4hEnK0AuvXawtUu+PtTtYQbtpvWUFn0bYDIcmg5Mlr0aUzQC7fQx6m
 YI4cVh95q7c9+Z+xrVzA8zsu/Qoee38HUbk93Bhnb8o9n4bVtRhxFlxvUJ8/ph1fuU44
 +cjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768511153; x=1769115953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jC8lA6B0ipWoMHR75M2AQCJx5qPi+JNV6zZXo9VKefg=;
 b=lrCSjw3rB1QpGNZWmA7d1jom8xwAi2Td9F4zpXnqVBXJSzVCMik4xmLdeUWpTkriAl
 VF3M7zBSg+jaXd2zOx/ONskCz4sRONXKD2rq8200nMz7DLtvtrfMSxQTj7uWafPmZU58
 qTsIqOR5rjLJxc4E5NfpTKvaknCKsBxirA+xDjAhsddh2bbuBrSqTj7moO5z/wKlxQSn
 yxzeNSpyJVFdrnqf11kqnKVwqs4Ch6HN140qi5YYXr3CYg6dLZXuqW+3PopQTUHMXk7m
 0tqobHg55trzTjU4qLZOEG9mNhlCxDyJFqc8K+HRbGP/DfJdkp0Cb765cPRdkdIZM0pR
 XAKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVCZ1aMFyUPmdKXe36X7DIh5Ss13Z/82Tt/1rR/WP0vnp1xG6n4x2nRgweZLTy76ZY9KRTDDV9CFs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7k7AeeitrsXasmDVwWQC0CW6mzRTG5d1gpnn9w46PuAVnibz3
 GnL9pM3eM7lZqyEZHt0ab4NvdCgOYJGf8TzSKOXsIExxFXBEPOL/AijpOqDrNp7/P8Jx8hMEFTI
 A+BogrbQGwHOKI7v5weQB5ZVrdOd561cn2h1Ur6RC/+1P/z9uWRsStLdC8TJqQpKQsXYDgOY=
X-Gm-Gg: AY/fxX7GfhKuCjjl7mofIZOtG+tZLpicsL4lZ3S4khvB/1Tb3PRCuvIlwIedw+P2JHs
 8DTUsXETBFOJoLs+3/Ktr4bqO4nhsMaqepEQFXQhtLqO3MUtw0jhCthe9wjqd3pLlglvD6ziW6Z
 0Z7UCoyXa0pTdk9FfYt64NH2ame/lUXTMeA6apEkORrmHLWTWM20iy6r9tQeUHj06w5oEAPKwZJ
 cvdyMnuMtBJprbm1rlIbF1M02O9ZbptL9G/iYYs9O3aLACGykY8FYFYikaXQDJ4TRt9tE7p/GvX
 6u7awWEyv2DdJSGOMmAKX++hAl5TGwtxl5M70Vopkzo4H92W2QJdSRJb1tC7gNW2/BjxKLfGGcH
 AXUlo3tgjFIVK3OD7pxH3WD93cQmNIgDzla/Ef9ws2iku7rhxXwYXSu3KW6KXOhX/Nc3FC5PdD+
 3Z/2zpV4jfGyj4uXHZm+V/lvM=
X-Received: by 2002:a05:620a:4610:b0:8b2:ed29:f15f with SMTP id
 af79cd13be357-8c6a68d9299mr104181485a.21.1768511153512; 
 Thu, 15 Jan 2026 13:05:53 -0800 (PST)
X-Received: by 2002:a05:620a:4610:b0:8b2:ed29:f15f with SMTP id
 af79cd13be357-8c6a68d9299mr104176285a.21.1768511153011; 
 Thu, 15 Jan 2026 13:05:53 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf397672sm155740e87.61.2026.01.15.13.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 13:05:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/msm: remove some dead code
Date: Thu, 15 Jan 2026 23:05:50 +0200
Message-ID: <176851027323.3933285.5242543959069807337.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aWAMIhZLxUcecbLd@stanley.mountain>
References: <aWAMIhZLxUcecbLd@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6FGN1mUTFG1u_4uGjYAODbkfi_wp0hUw
X-Proofpoint-ORIG-GUID: 6FGN1mUTFG1u_4uGjYAODbkfi_wp0hUw
X-Authority-Analysis: v=2.4 cv=ANDFHcx+ c=1 sm=1 tr=0 ts=696956b2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=vfcw8cltYcJMyB0lYhkA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfX3iZ+pnopvalU
 fzzNDWsVvxTpfMFHm9t90sfbKNt47dAYseMPMIJ7TAszMA9rU33fJYaQ56v+QAj6H5avh32o0YA
 CetEYfNlN7e1bJ+xKf7G3uI+bmg3YXdlgmul6GWJhc1+rKZaMofru332V/uTa26v43Bz/+2lCwI
 igmZtUxNdGBjphoMd3f2WuhoUuST9bk00JgYGQcg8D9GxnGiIyCtHwxJipt+tyMpmO+epquzEbO
 lTM/KYSP8Yv9cYNB9bRk3iWMH/Da7gbZOqieTf88QlqAIMvdAFT20NUtbTyZNPW7KWW+RnkQrpV
 YRO39fLIWfT5VoKdhnMwr+mESMudzYiKU35Glm+WpNu1mX7mzpkci/ArI6PnnREKmIqZSPHiuUk
 yQQyYpam7lLEQ8+lyjUzV0iHex0zlGQ4hCqm5iEEjmZFCh7VxGYcvC0Kup2L9uUUw5Mn0xItUM8
 RN7/mHrpLLQxzcu96RA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150165
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

On Thu, 08 Jan 2026 22:57:22 +0300, Dan Carpenter wrote:
> This is supposed to test for integer overflow but it is wrong and
> unnecessary.  The size_add()/mul() macros return SIZE_MAX when there is
> an integer overflow.  This code saves the SIZE_MAX to a u64 and then
> tests if the result is greater than SIZE_MAX which it never will be.
> Fortunately, when we try to allocate SIZE_MAX bytes the allocation
> will fail.  We even pass __GFP_NOWARN so the allocation fails
> harmlessly and quietly.
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm: remove some dead code
      https://gitlab.freedesktop.org/lumag/msm/-/commit/37d2e108de4d

Best regards,
-- 
With best wishes
Dmitry


