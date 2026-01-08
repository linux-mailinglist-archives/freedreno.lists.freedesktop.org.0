Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 390E3D031EE
	for <lists+freedreno@lfdr.de>; Thu, 08 Jan 2026 14:44:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BCC610E730;
	Thu,  8 Jan 2026 13:44:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SSFZslUn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KU9DXhuJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D15910E734
 for <freedreno@lists.freedesktop.org>; Thu,  8 Jan 2026 13:44:02 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 608C2e2P3890559
 for <freedreno@lists.freedesktop.org>; Thu, 8 Jan 2026 13:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=9IG5R1B/DNG4pTgEjrKT98zy
 +g5kbLjmMUpTgn0aHJI=; b=SSFZslUn8XqWiuDPXedoq8AO7SJPBQSvcaIZGoEk
 Um5cltnwmCW6xdIRb1SStvjsXCHXVT+nPS7ueec6mBoI25d1rAs8H8Po/BKjZ+cG
 t/6dpHk4Nemwbcr4662Er6kyhe/Gl1ilwhBuB5aG3ocigrvQIGW0NrTb0RkoQUYy
 UeiJo3f0PV+q4RYzc+Tdq3rnSjDJdR/WCXMUAVc4/rItZOYg8tmyUofykR3ICOw1
 ZWFoalngPyGwcKMamMEh2OlO7bQ8asuQmTFIccFu96HrrNt2SRt6Bbe1nd0JI4sF
 V1GAj0HLd/TfRsCUFpFfcs1vrfLl46njOhCU/OSEiMBR1g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhuy7397n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 13:44:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c1fa4a1c18so756923385a.3
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 05:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767879841; x=1768484641;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9IG5R1B/DNG4pTgEjrKT98zy+g5kbLjmMUpTgn0aHJI=;
 b=KU9DXhuJEPUsx+mU32t8ipS+6xwnrQ78Yt6uxUs0srBFHA1s86Q7zxfOigYdG5q7K1
 52W1EuxvsWMbVJI22gROxwIlu/3SdLfdBmilznmA49Gd+Xu1wF3NXn3ZrCSA7b0ibPNa
 JQ1n+62088htBsYdoMgHy+IBb8Uj7sdKweCI5l5YtsJPIdurMnP+lZhCbqSCA5XiSynC
 m7K8faT2HqzPu+oJgjBNXMK266oQ09/JR9isWXXO1pufJW9yZkB/7qGLNOru0kJj+tSI
 OJ0RWkRJAtPUafjUqVpCmNZMdhR+fHHknUrm7qsYjmVsPS210x4LZKfuK9JSIPz5W7Pu
 Ciqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767879841; x=1768484641;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9IG5R1B/DNG4pTgEjrKT98zy+g5kbLjmMUpTgn0aHJI=;
 b=m26QqcKBE9zx5h0usH6KKuFfVnTDLMmju8tUtg9gBSdMk79t0eM6ET4FEYW5yn/Ju5
 kBgUVwM8AGgxZnJe0K5HYazyJ4vnHZiDpZmZovUDKF+wqKmk5KCdORrerBPpReBBblys
 QTd/oUJ+v8A2JCRIntRBcLZwKgK9LQeLragctK+9CHz7SKi4I8tpJiO25Wm+cNis5tvO
 N6c6H7MXgnuepQTbRhiBp0vczYJcZFdmhIIfSHdizguZ7MRqa03GWLdIWJZTuJxTqyaN
 atXYUHnZZZ+rrfap+l7MKhtsqo9pylBdwd6xhJ0/oHObt0Pm1bqsvV1KCftI6VeodeNM
 JX5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXMS+5kOAwxdFlkqQ0hxBcz89BP6xK5GX7qRX1WRbZozNcr+yhffpc68qWsjQu9yXOlXi4pTMcTkg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxn2Pk/zqOjVlIOkUCGtgbkWQ3XyWft/srvKMHVK/7UmnjEYJ25
 0D4llTq82V4lDjf3hhrCSb0sQ7bglmy0xjFB/A0t4P3Fdq9liYAcCIhyH2IAA+aNbKfZd0h3UIv
 rEuMmlJUt7YKKfl8lPJQmXlTgmhYPfCW8fHj/97u8/c9N/fw8hm+cLb991zz/VhZegPX5PVU=
X-Gm-Gg: AY/fxX5wDryA+dxYB8kbra0eJhZo58yjLLQ6bl/aO2B+LkXp13zMg4oZSwEd2VSHGiN
 OTryizshZkSyH2Dtxlt6WRh952VKdBBtJ72Pj6vTzm0HjlGa3f4Q2iFtXdbFgOq6b7uImCFKxvB
 OxyXKQ2bOdWFrYPwZ0cD9vBF1ooS7qzAOGx72uR3g2cYGKG+Qf/PYoUsBwTbKdH8A+YoZB0JE4N
 yg7t1/9JaJHMYOOaCA9YmKmM9efGMUzvjdoWUIkZJaZHOyl7lEjVqNs+q2He9bHu6SRhvrHk0U7
 Ps9WmepF7sU+nsmypFo8qKcDJfAl3Nk3ENFGW9kMvyWgWzR4kDfSZO4P4/Q7BQhu5MRf2xyjT/N
 hyKrz3HEQvO4fbNxj6iLEFLZj3qu3SJYTlN19kZcdR6gvzcFbRuIy1mBQUsMp2EAbONHMAiwGw9
 nnFijT9OTfBRYTkxzJD7nHsfA=
X-Received: by 2002:a05:620a:1726:b0:8b2:ea2b:923c with SMTP id
 af79cd13be357-8c3893688f5mr835606385a.14.1767879840680; 
 Thu, 08 Jan 2026 05:44:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHw24bHW3oIFsvmb8e4lRriEpl5Nr6dkfNLKdXFFfpxh47NA7FTc8dVRffTR3vOBjsIlWDfRw==
X-Received: by 2002:a05:620a:1726:b0:8b2:ea2b:923c with SMTP id
 af79cd13be357-8c3893688f5mr835602285a.14.1767879840191; 
 Thu, 08 Jan 2026 05:44:00 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b6ac0a769sm1706120e87.21.2026.01.08.05.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 05:43:59 -0800 (PST)
Date: Thu, 8 Jan 2026 15:43:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH v5 09/12] drm/msm/dpu: Refactor SSPP to compatible DPU
 13.0.0
Message-ID: <b7weoxyja6glxeqal3iz26mglyvknxa45btkcaipgdl7zmeahi@ab5qc7go5xex>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
 <20260108085659.790-10-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108085659.790-10-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: bPDkQNdJ9OteGcSnOyut0zjCsH9yII7l
X-Proofpoint-GUID: bPDkQNdJ9OteGcSnOyut0zjCsH9yII7l
X-Authority-Analysis: v=2.4 cv=DZEaa/tW c=1 sm=1 tr=0 ts=695fb4a1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=qJVVUtC8YRK5WH-1NpMA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA5NiBTYWx0ZWRfX0tq8q60CaH8f
 /lLHKA/3ZsmYoU8+Lb4DWROgUbBT7pYQaig1+YbQky2kAbqhCnUjBXQwZyPv8iOfQF1CcaLmMCb
 Z9jutAjvhBn6rgq1/9FY5J3/YlEkOIiMMrq6/LvBeFIQj5ba3oMf2hfGNFjp+OKkdrRuiHsBVoJ
 FNTyuWaSOBX7b4mQmwhJ9/oRyKd+RxtCqjDPmMKhsXpBEF/RDwHNlB9HIwdsuOLMlsh88+9mJaO
 W3uqthz67X8nXUPuzxlzGCXrxgK7l+Ln50C6dcgRnW1SQ+D+zIA75G4v7ICQWWu9p87VykreXVx
 wXxAnv+laTi2kjTDZAEcM8KKZrbPLAjvmIGh/2+bvcfFivJjDz+0GgeJH1y3bwtyIOJSSHbhyOG
 Bl0uRAy8QHCkuCH2d6swR3ZR4wVGtcd9B0c9+gvrQm5JA/p2gdbfTx2JuElSGHd1OZmDWyqY2Qa
 AlCscYvv3oXuJBF6+Gw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080096
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

On Thu, Jan 08, 2026 at 04:56:56PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> DPU version 13.0.0 introduces structural changes including
> register additions, removals, and relocations.
> 
> Refactor SSPP-related code to be compatible with DPU 13.0.0
> modifications.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 110 ++++++++++++--------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  52 +++++++++
>  2 files changed, 116 insertions(+), 46 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
