Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB2FBFFDE1
	for <lists+freedreno@lfdr.de>; Thu, 23 Oct 2025 10:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3514D10E37B;
	Thu, 23 Oct 2025 08:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M3D/dYor";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE5C10E37B
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 08:22:19 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N8AXCY019179
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 08:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8FruMMDEn1euhlML1huGGXWeCVKOxK18le6bqpoMasM=; b=M3D/dYorK3RcIt7H
 jJ55aYz/7RKPCryvULpMhjyJ9CHcFylvfk/9r8H9Tn2J8jtVr2TgatzdVW5ocAzz
 KlFXjdcFtGC3bI4brJU+UxlgCUrsy5NCxQB6AFvK423OOVRf7+11JVVAhbuDANhJ
 L2L0yPns8sRASb9lkySjZ9xkYdGQ37kadKwbrS0+vxDvNpJXaJq93zyvQhvMMlV2
 Bzktpfq7R8KJtQyDbqDVqOjpjPsKyx+65fIbayk+NxEHOc+CbVMUjr0YnSCjgUfY
 y/2yIXnKfwTbicUp8R09X6pNgtrzl6ZCx+riHFJkKiF4FLWyXcaqCqisfooJCSrT
 FXqyfg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y67qhjvb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 08:22:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e890deecf6so1211251cf.0
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 01:22:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761207738; x=1761812538;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8FruMMDEn1euhlML1huGGXWeCVKOxK18le6bqpoMasM=;
 b=VICnmsk4QyOsmj4kjKATLBJyMf05RDLl5X5jnsBUtyZiz527hoShlQVcPjevIzCnC1
 k+uDpXaOJzfCAMNpeZ9BNDbsAtBMU5mI7lJ+dWZqXysNeePbLC1YJTfFsPeQHfjIM95k
 qalp070CMNiedrEvq1Bpqre+K/d4e/Khv2sLGQQYy5FWB6dqISzauVBVtDUBnuhXkU/L
 QC1GyZdKWyhiVX8uJlUddw53H/LEXohHytA/gIQIAywWjp7haR3wJDprQi7Tq0ecEKoq
 1pAOuy00vIr2v4/CMp/SYsPqySD/Gz+Y1aC5lTPTPmpQtTLD1O3H8UYBnZ3CHaNsnq5n
 wygg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpAJ3V0nCCuYIUaHJcEYEoH/n/L+aZ5zA8BiN+C+L4LFXjmoUZhwuYzx9q6X65k9GBmxuCpEjt6aQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5YMumFT3hw2hLSBNDxVql2vSsXDi8bX+AeRoc6I6Cv3rse290
 SkOZNAQ2d9+Vq8X4XJHgiVyidFRxhdml941VwjegtGem34xCOagUBybrPQNK//z6qBLBXZBp7rz
 Cvvx+QivnZaZnDqMCa0UWjIFxBAxjMaY8ArNcK8/MRq1vY6y3ZJMt42jMHugHaPH4EfWZbmk=
X-Gm-Gg: ASbGncsO+hN31FKegUurFxBkF9C3mUOQXFVpz3GNrh8VoUFIHMjxAHGRdRtPpR3qbuK
 UFmkoAvO081o1QlxS5yKJgHtqk5zU8KyA4vXZ2Q/MTLaDiCMmQmHh3NmxfkmMRLpcq5Ni5zrkq+
 Jx9WCqGyUP8HbNpy+dD2FC4CK/oeTD7OtgWG1TBzyPm1EZIlgcarzKsnyKbllMOvW3O0iKQc2Sy
 haaG/cPM1/t4BRdvmnlXdn+v2aK160vi7nm/OOsMPYjHFLT8bHN4ko6ewvsHFdSENVtcuAhLJwR
 2yqS8cFbllj2kEmndpGEH7LOgyeH0wZlHWLqY/V4Kr7B1l6AZPNNmPO4PGsCgsavpUPjyWf3Q43
 aS7lL0/kd7ObiJ8OLwag1is6ys4taynBcKHuE0obeI31JlbqHXAdneuGj
X-Received: by 2002:a05:622a:20a:b0:4e8:9ed2:78fa with SMTP id
 d75a77b69052e-4ea116a2337mr82965371cf.1.1761207737716; 
 Thu, 23 Oct 2025 01:22:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2XIoSLrV1GTocr6bbATcJdQVR3JTJAVs0QtA04SjsNS+0NDII1q5KQNFmWxX0Qxq+jTp1XQ==
X-Received: by 2002:a05:622a:20a:b0:4e8:9ed2:78fa with SMTP id
 d75a77b69052e-4ea116a2337mr82965141cf.1.1761207737193; 
 Thu, 23 Oct 2025 01:22:17 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d51471c24sm157607666b.75.2025.10.23.01.22.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 01:22:16 -0700 (PDT)
Message-ID: <4f9573d3-41a4-4478-8c19-39716b29f587@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 10:22:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] drm/panel: Set sufficient voltage for panel nt37801
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>, robin.clark@oss.qualcomm.com,
 lumag@kernel.org, abhinav.kumar@linux.dev, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2OCBTYWx0ZWRfX/ptbtKjvG6u2
 KzloFJ9vcMgKtR+8t6svdiS7H8xs6so20Fr4T1oasaIgcWwlw6QGwn1Ug4nS9qm/HIRGB+Pk4lA
 KhrpkFo5XYyfralnnGg3QMFn/d9pSYVQjLt5OqaFb7ln5PYUfItI6hAfI08USo9FOpaUuU2s8um
 XJHOkeV5iuvQucSeqPWMjTGcvB4ZwkH5u/VRO73sFIC1CimaZO7FLjms96IeZrw0W9+zICzuAba
 jxcPmpS3k9MMWFbn8ssuzS80gqGw/qkUL8dZRfXPhD3QkW/gsBKKoWymYo7ocKKPoJ1qhTESj+A
 wK3y0x+FvnNl7uIvjQTAtGoY4VZX8IH7vVE3johs0OdYRAL2q8cH45LoMZgqUPpKEH61/uU0fk+
 6pXsq5UZzxHMymVyVxQtakrhNnA58w==
X-Authority-Analysis: v=2.4 cv=LMRrgZW9 c=1 sm=1 tr=0 ts=68f9e5bb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=91DCyrf_GaaWAzlYtecA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: XuyZMujhFg2JxBrgMmSX57tlr6zMTT4d
X-Proofpoint-ORIG-GUID: XuyZMujhFg2JxBrgMmSX57tlr6zMTT4d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220168
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

On 10/23/25 10:06 AM, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---

This patch should have been sent separately as it's not at all
related to extending the msm display driver to support Kaanapali
*and* it goes through a different maintainer

Konrad
