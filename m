Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A328CE0277
	for <lists+freedreno@lfdr.de>; Sat, 27 Dec 2025 23:01:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A83710E093;
	Sat, 27 Dec 2025 22:01:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cNueiVex";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K7gMEOMT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F7010E093
 for <freedreno@lists.freedesktop.org>; Sat, 27 Dec 2025 22:01:41 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BRLrcnm1278734
 for <freedreno@lists.freedesktop.org>; Sat, 27 Dec 2025 22:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=pO8sXsjpC1mymyf3RPF2mIgo+wJbilrKb7L1QQvYui0=; b=cN
 ueiVexldwqznBzp/R9Q+VmlM9mG6a/H7Hwi3ylen8dIGNHZc6kNvsLKYghVXIUGq
 PLq71ettTybVSNTgsQeMXK7gjIs2ur5FqxWdqqtNBb96g23IcLvzpLorWeQM6moa
 tWq6GUsN9+BhhhH9Z8Evndn4m1QDjbY5Kx+VkP82SceJpPIkxQtJgqB4Deeaz8Wi
 tzVwxREX32bfzbbgDZLgnohi78xhbHY3H7Opbwy0Y9X9GsC4ZYSdWuffW/KMl0Xf
 pncme/F/2uW8ZyqNAyq3J2y2vicp3LxWy/o4kw+cODyh3t91N9P1BIOKeHgreHms
 O5jQTUHa0lbC5/H735ZA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7u5h50m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 27 Dec 2025 22:01:40 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id
 46e09a7af769-7c76977192eso27375941a34.3
 for <freedreno@lists.freedesktop.org>; Sat, 27 Dec 2025 14:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766872900; x=1767477700;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=pO8sXsjpC1mymyf3RPF2mIgo+wJbilrKb7L1QQvYui0=;
 b=K7gMEOMTW433qzQ2bMxq6sAIJR4W8wHG/rZNgxhxwDNDu1+xiHJ3VbkxP37KSri5Yc
 /uQAoYIu9TiR9m4MoYtuuqhUU83gWIYdroC3Ze3M1edaOKv5kf7xki0Ol/tVlpjqwmUY
 jZ97TwlqQ5gqH/CqTSEiValkhKT7Bo56HlveLyCFLu42s+npCib+ULsiONBa4qAiZ55H
 P2/f4zCD+jvLZ8cK97VLl4qpv5PohRw10jXXNMYcMlUQb3vHp/7kfZEWjs9oGtw4C4wB
 +cPtJIOavpEcw+Rg/x5jQcNzeaEdURcN7ahYao1P0tJ4h3EE4ggBWxv9FyJRBcxs4+Mh
 2LgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766872900; x=1767477700;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pO8sXsjpC1mymyf3RPF2mIgo+wJbilrKb7L1QQvYui0=;
 b=tcGxhUPua9HsnXZt7SJ/ccvtRC+vmEVrT/3GZcZvaOKajzDCta6HxMgArceSikoiem
 6efdF1bzmrVNKk2Gv9MGWhmmLThNSCV0hXi22wBOu3BbJRXgpbsfx2+ElCeF2aPYnHuM
 lk99jNQL/zrke+ptQA9TQ4T2gjXjV5YmtW70585MFgtTTgH8xo0sSrLSsvfBPvZMFCtQ
 1UYT1LbREOSJQjsc0XJeL/B2+rI6g0gTu1Ta8JCPKC9xS6KIQk7W6nU70LHedqJpwiHZ
 X0v66K3aDmnF0suE3wEGEDv1OtWVdB8LCkxfqUBUz9OulpB7ljI/7Qhbn0z/EBlQHm4x
 1vRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtMozeQsakS/jJHkubgVU2uwoQO6jDv6MDvN0RR7SfEmi+cc8al3AqdtlhjwWa2KbHM1kEiifrUEk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzU1HM58gyw8qwHgpcypN6Qg306w55d1Gcfx9j2RcnnscxbzXVi
 WdCZWvCJuUX4zaRN5mVKMMrkCAi+5Vktr/tBGXTIT6Z/Wog4qjoDJLtbxv6OVHq1TyXSV+m6dRh
 E/VAiAc4n4XLTazUno/jLUvB6Ac2ylGAit39vbu/0KH6shPeqrw9g0IQQtCrD7k3pUt6a6SruqO
 OsBDNJZ5WBt2BUJEnHAIlZpU20kaDDdT8QUYFFq65bi0hd8g==
X-Gm-Gg: AY/fxX7K0GMkpBWdyLzVPG02W1jCX3+0RtQ91uqJRlIAmY/8f76XZlSKj58gMqTUh2/
 mMz8BYDh+4Z0yUEjORcu7nGAJzQBp5KOi8Hv3EcZnnLsfDSyJc2IFtdvx/xDQjcwcBUOkMINFNY
 5O1e3wB37A0puwpd51q4vwE9rpW7x0Ydx2N5En6uhY59WbNwHH4D+poUGfIaNy9LfT
X-Received: by 2002:a05:6820:16a1:b0:659:9a49:8eff with SMTP id
 006d021491bc7-65d0e94d552mr11403593eaf.16.1766872899881; 
 Sat, 27 Dec 2025 14:01:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzb4zW4dLjwPdHMOvYj05wm+MfjPb34VcT9TsoehzbCF6wlzIIoa+dPdGc9MuUQSmkC9V5RnjsUikqHujWASk=
X-Received: by 2002:a05:6820:16a1:b0:659:9a49:8eff with SMTP id
 006d021491bc7-65d0e94d552mr11403583eaf.16.1766872899502; Sat, 27 Dec 2025
 14:01:39 -0800 (PST)
MIME-Version: 1.0
References: <20251227110504.36732-3-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251227110504.36732-3-krzysztof.kozlowski@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 27 Dec 2025 14:01:27 -0800
X-Gm-Features: AQt7F2rdY_C4YMdsNJkz061LDwa5bm0PMmdQw-ruVy63uR-ECPDsV4GuxQEQy3Q
Message-ID: <CACSVV03H_oii=fuhaeBhUZSJk-2mr08jGqAs30Z_h9tzeDgdtw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display/msm/gpu: Narrow reg and
 reg-names for Adreno 610.0 and alike
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: u4Uon9X-GYjJprJlET6SWcyYjCts224-
X-Proofpoint-ORIG-GUID: u4Uon9X-GYjJprJlET6SWcyYjCts224-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDIxMCBTYWx0ZWRfXw0XOLy7D38/l
 2Ch10WTcZyN1m5m6nXhxjgK06Y8vvo7U6sCwoa9OOFrsCMZq1gscOdeo4R+B4D666lFFl4dmp4A
 oRx78D+fS9BJp1ir0vDVOuRFgVusSFdSiUBa3Xm3bxk6ijgme3zTYcvXeQ8YcblvN+m4J4XX4RL
 IUdZy1fBTXnKiJFyIuvS97xEz2jWGjbdebg66cqpoutoHp8KvDzMUlPXjryaqsVTrC9rvQynfbt
 Ub/xz2d8ADGnDWVJ7pYHFrNDXW/xBGfQSkX/h+x8HNkdOSJMxxmrjQin+o6Az1CJJbq4KSPcven
 wFaC74YQEFxv4lpIOLNmlbv2tuZFCYkjZ0HUPbMhkbVkrRn9hM0/m/FzyNdI3YYn9r0W4eaLmq4
 LrHuph9rfkOpkecjJ6ZqBUx6/PfkISlnlO5mVMr18+GdnlN+QD0KQ2gMJAjH5C3f8aQl/ps5Sde
 J7F2XP+9+XoiTQ/qS2w==
X-Authority-Analysis: v=2.4 cv=DptbOW/+ c=1 sm=1 tr=0 ts=69505744 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=4-z9Zx1dy9oFOqQo8oMA:9 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512270210
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, Dec 27, 2025 at 3:05=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> DTS files for qcom,adreno-610.0 and qcom,adreno-07000200 contain only one
> "reg" entry, not two, and the binding defines the second entry in
> "reg-names" differently than top-level part, so just simplify it and
> narrow to only one entry.

I'll defer to Akhil about whether this is actually needed (vs just
incomplete gpu devcoredump support for certain GPUs).  In general
cx_dbgc is needed to capture state for gpu devcoredump state
snapshots, but not directly used in normal operations.  It seems
similar to the situation with mapping gpucc as part of gmu, ie. not
something the CPU normally deals with directly, but necessary to
capture crash state.

BR,
-R

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Doc=
umentation/devicetree/bindings/display/msm/gpu.yaml
> index 826aafdcc20b..1ae5faf2c867 100644
> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> @@ -378,11 +378,12 @@ allOf:
>              - const: xo
>                description: GPUCC clocksource clock
>
> +        reg:
> +          maxItems: 1
> +
>          reg-names:
> -          minItems: 1
>            items:
>              - const: kgsl_3d0_reg_memory
> -            - const: cx_dbgc
>
>        required:
>          - clocks
> --
> 2.51.0
>
