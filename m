Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 118CDAA9555
	for <lists+freedreno@lfdr.de>; Mon,  5 May 2025 16:18:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24C510E2FE;
	Mon,  5 May 2025 14:18:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4PAbizK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50D310E2AC
 for <freedreno@lists.freedesktop.org>; Mon,  5 May 2025 14:18:55 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545D8SBS013428
 for <freedreno@lists.freedesktop.org>; Mon, 5 May 2025 14:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4OMp8lVlfqOS6nQjtVYiy+vsTT7GaERnrIvMt0I4OI8=; b=b4PAbizKQdgKo4Sz
 hAnB7gq3XzspJ7yxkI0rAfW/7gt8MI6H80NV0PqEJqNV3uxySOCpIdYv4a0kcI2M
 g1H+XyC3/zZ8nd+XzuT6p7yv5WQH3G5GZtwy8+MHRWRMP7nTsg1OhRLVB8Ao2Q2x
 LkOtxTrcjQC+ePkmFGRmr3CN7it78qUDiXOhLLNJydEezJTaB/wbSUgoAEn3EOEG
 rKFYA+c7uVYVYrRyokY177Tx7LL2A80L42El0vWjD1xeGlYr1oHgT2qD08MrheoD
 BeqGEQ6MFyy3CrqaZ4pB2puT0olee4bxczYriQ4HokKGlV5XmOK/jOHNeDjjVuKv
 NniVyQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dcakm4x3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 05 May 2025 14:18:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c3c8f8ab79so192538385a.2
 for <freedreno@lists.freedesktop.org>; Mon, 05 May 2025 07:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746454734; x=1747059534;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4OMp8lVlfqOS6nQjtVYiy+vsTT7GaERnrIvMt0I4OI8=;
 b=U7BPDpENAyi7x8zTgkNc0rtdWMuD3wzCEs8QtRJJVMu1HAgCFLNKbi7Riu4QKPZwjy
 eWY+ajPq1hr6SKBECXrKfSWwddlzz3tB0jzylltb8SvV9Xlr8UzrjoLiGs/W487dctIE
 HNx3tgu9l9Ilgb4ydCKmXB9xK2CvFROVqgipe3TDUl50+o9ECzUKZAFx8GS/76UZ6yNz
 i5RXlKPjCo3mFXtarNbcieXlDbEN+8BHD1pilvBaa2oTn3axtLF3AhTUQbpLWbYRvXYe
 MyM1ounLTTNJrHfArcF3Ob40krCzXwNmgoEaA3WAEtp+FLUBO/UW0FexJ9fVYkM9fQ9Y
 zIPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWY3EeI4RK033upHX7scULK9tt7lDZ44kzJ271+glhJWoAgUHly2XXWuTMMQU+ZO2FRUwADVc+yDnE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3LF95F4F5q7hgJLRoDSDGvTJGTbP8SR1tV2eMqNlCrtrgZRAG
 Q8zY5/i4b7lZTKOIt7aVFFV47Fx0p3ruzGwGloC2SrU7qQUtXW8pcNOU3i9hEOQYtkpKcq26dGL
 s8f2klGGDZ2Wn5UwBUAOxdunolmV5VYYVDEaGhOpDlHAELwRscFSqGG3GKUoTBVpQSrk=
X-Gm-Gg: ASbGncvgmxLvDg6iJiXUdfjgtyefu0pZSK/nhNgxjcbYTZv3Y7IddOkGWNqPr7FFMdx
 4syLQP5IqYjtJrlm5puVXLBDhoY2zZKiZB3uqwEsz9eRAPi7M3xdAA+YvR5pEeRSLs4M1wOaJ3t
 ZckzI9sqvHAsXqr9uWwOid29CCTil74mIa/YNdt6rc2oS21/5iwD304XP3WjuNilWoUH2UVvotJ
 jWVUiWc/FW7DAJPaTmNE2YZA2Yct7ihP/3JHr+NuS4cXkup+dbTczNDc7bjCLtOh2g24oBSdEP+
 VWe5KHQOAtALuwPbWckz+XKEy4GnJxlz7UvHaIeHGVSX7nDgYmoz1DkJwzY9jPmlT0Ky+N9Nrzi
 0DkIzwXaLt9Q3oBkucpiQ4nwZUPgyEWJ8N+pQZVcboiIQ4G2BaaE34pI/4NbjXOIG3nH9
X-Received: by 2002:a05:620a:1a0e:b0:7c5:e283:7d0a with SMTP id
 af79cd13be357-7cadfe15ab6mr1528029485a.30.1746454733831; 
 Mon, 05 May 2025 07:18:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxLIuDmlMk0BDjjG/jcKroZx3ooAtnxfCFD86oCFhHuF1R3mpWcw+w7OoB3Ift4T6LrXoRzw==
X-Received: by 2002:a05:620a:1a0e:b0:7c5:e283:7d0a with SMTP id
 af79cd13be357-7cadfe15ab6mr1528024685a.30.1746454733441; 
 Mon, 05 May 2025 07:18:53 -0700 (PDT)
Received: from ?IPV6:2001:14bb:671:42db:147e:6740:cd7c:7688?
 (2001-14bb-671-42db-147e-6740-cd7c-7688.rev.dnainternet.fi.
 [2001:14bb:671:42db:147e:6740:cd7c:7688])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94f2043sm1707308e87.179.2025.05.05.07.18.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 07:18:52 -0700 (PDT)
Message-ID: <4a186d4f-9966-4569-bee2-77e237cf0c54@oss.qualcomm.com>
Date: Mon, 5 May 2025 17:18:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] Various dt-bindings fixes
To: Rob Herring <robh@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Robert Foss <rfoss@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Rohit Agarwal <quic_rohiagar@quicinc.com>,
 Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <174637445759.1385605.15383087742490646226.b4-ty@oss.qualcomm.com>
 <CAL_JsqKr8Xd8uxFzE0YJTyD+V6N++VV8SX-GB5Xt0_BKkeoGUQ@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CAL_JsqKr8Xd8uxFzE0YJTyD+V6N++VV8SX-GB5Xt0_BKkeoGUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEzNyBTYWx0ZWRfX4hHBLWexVzj1
 MSiDTY1OKX7Dh+ixrlVcENN3l1RHxI0nQtsY9WC/B8AXiLmckkJ/ruGHW0GQ5WwFLFOoc/cGlFd
 ZN0P9BKaYLg6csjK/i5k7e3mOmxECjhbAFF9ymmDtMY+FWzTHnUi3QNgnCEnqt/j+sw82LQtUIz
 sX3XUmkvQJVc4SiaC6sr5ZbAhlNNByzBVi4XTo4q2I7f/89JlSyx4xE9CFsHy8akTZjutCMrdh7
 27GnYHq1gEzrAE5z5RavZ9/pEu/jKlla3rECsefAX23n8hXkcB68wd0r891Z3QO1/jBF1gu9xp6
 XWbxG/da8s/jfD74ebqaY5uviku/YUBx+SopZOYAcGDcFKU/P/u0f+wurBLm4ZcKL9K2EC5anzU
 4+S5BWlrXiCZ7OVpF6gjbuNPzllcfh8/6XnZ4RJoCqudNDB+THIuBiYFy3uOzHIdBAUwskFe
X-Proofpoint-ORIG-GUID: vo4iJQFXWeiRNK3gr3Az3bmvJgffPRS5
X-Authority-Analysis: v=2.4 cv=JtvxrN4C c=1 sm=1 tr=0 ts=6818c8cf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Y8Lu5Vov3j2QtJBI0v0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: vo4iJQFXWeiRNK3gr3Az3bmvJgffPRS5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050137
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

On 05/05/2025 14:56, Rob Herring wrote:
> On Sun, May 4, 2025 at 11:13 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>>
>> On Thu, 06 Mar 2025 19:11:12 +0100, Konrad Dybcio wrote:
>>> A set of not quite related bindings warnings fixes.
>>>
>>>
>>
>> Applied, thanks!
>>
>> [02/11] dt-bindings: display: msm: sm8350-mdss: Describe the CPU-CFG icc path
>>          https://gitlab.freedesktop.org/lumag/msm/-/commit/60b8d3a2365a
> 
> And now there's a warning in linux-next:
> 
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.example.dtb:
> display-subsystem@ae00000 (qcom,sm8350-mdss): interconnect-names:
> ['mdp0-mem', 'mdp1-mem'] is too short
>          from schema $id:
> http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.example.dtb:
> display-subsystem@ae00000 (qcom,sm8350-mdss): interconnects:
> [[4294967295, 7, 0, 4294967295, 1, 0], [4294967295, 8, 0, 4294967295,
> 1, 0]] is too short
>          from schema $id:
> http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#

I've sent a patch fixing the issue, 
https://lore.kernel.org/linux-arm-msm/20250505-sm8350-fix-example-v1-1-36d5d9ccba66@oss.qualcomm.com/

-- 
With best wishes
Dmitry
