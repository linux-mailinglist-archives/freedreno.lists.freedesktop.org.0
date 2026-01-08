Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38414D03759
	for <lists+freedreno@lfdr.de>; Thu, 08 Jan 2026 15:45:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 135FD10E756;
	Thu,  8 Jan 2026 14:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hElMPaWp";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="THQmiDbA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E44010E756
 for <freedreno@lists.freedesktop.org>; Thu,  8 Jan 2026 14:45:55 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 608EVoHr1496298
 for <freedreno@lists.freedesktop.org>; Thu, 8 Jan 2026 14:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=pq2wpHyoeSeo3GqHlkYEI4kR
 dN2xjLc7p2A7VL8bab8=; b=hElMPaWpSDnK8Nl8T293takM/9sTGm+HwaY6o1Jg
 TYLvhwxU0qLR7N21twWwDB9dbQcH0YpCAsnrJ+n/78w3UaaQGh3HzOaCm4Vhwtn9
 +nogCtGxpb38KlvyCqI1k9mKGyBiBkaUKEFkG2RpuY1Oy90HHI/g2r7IVNwz95CX
 lMO1JdmAzquKjonEadUKAT/KIDZ7YYICF/MFpkyLfUPKhASu1oHDYQZzS8vXjIOq
 Lb7QwxQ74NgUZ/oO3Zyroq/mE+0C9EGMRthaURzydqwp+eq7EaeGoRfvNW+DGZ2W
 Tn3SQOz3i1rC+Vz2dv8BoChN3VJQSeaXG9oOWBGokkEqFA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj7ua9b1j-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 14:45:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c38129a433so798024885a.2
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 06:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767883553; x=1768488353;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pq2wpHyoeSeo3GqHlkYEI4kRdN2xjLc7p2A7VL8bab8=;
 b=THQmiDbA00LDpxDqKUv9tNnddLH6n0UaMVH6pF1LIAyXD9AKE+LkxKPrqER8WnPJys
 yp/7qraZ5kXkwsb5Cd+mHqlH+GstH1fvGC5guNAYjtI4fQMKEIZIdVDS2Fj85HDk+w9Q
 G37aAARDoZG+dEWJv25PtcH3ZsNE8RIXyP/n1+ADzN1EqjkXJzDuo1mSt3ULFgNyz0Kh
 qM/YG2b+y1C+YraQpukTWL6M2kef22MSs8LLFrGq8Glm10W1eaIWgH62ScAtk/k8EB6J
 BO8WAwhRdV107R6dMuWLeZ2UeHv4nqktPrIKWuxRFgccbBIuQPQFG6n5lj0GXn48T+tF
 uHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767883553; x=1768488353;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pq2wpHyoeSeo3GqHlkYEI4kRdN2xjLc7p2A7VL8bab8=;
 b=crZw0CqBOhi7+paEw4pg8Cor6P4uKKJ1LhBpKN2GocBBw/ePrkmgBuHY32ePAvCZiZ
 GsZJcsZYliBj0nGCUnGsD7vnnSYq0JcM1SV60C6e9rbbLAyQUT5MpBW1UTRsPQwDUdry
 fPdlLhG7mIgJRCgYiJVZPpENf9ie9wrXTcCA4rLqfYTzRnaKSGsTGKki06xOewgRBiRb
 ZyYS519afDE8vMrjQqK4X7Xk0+5ldsVhkT2VSFINI9Nv3MUQEmBSXRHXo3OHO+DE92W/
 TiDjS5coV4pziyh1J8Ks9CgIlEBqbknWHExPe6uUKwa6CGJGsT18SX0Fki8jOxFGaFEI
 fZpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTS/K7blUvZck9H9joPantK7OKl0KMMGsbKOWZkFmXEZRBK5c2QmhOi7au+jBQDvMeS/Gusae0PNQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9wYvqzTXWcxYejPdDW9JTipS0WXxaoDZDwOLZCPOhuBG8B+wj
 0/tJ3paqxvIZv+kEHn5eU78iArpo4H8dZcRH+vntzSkxTFZkpFxfw2b0yyb9jGDnwq5FVLnppzM
 JuyxBXxed7cCICuQWbTp+XELvWaBehQ+N8NkKy6IqxnTZoGbqb/z7wcDHPbzhxuKrOSsbQGE=
X-Gm-Gg: AY/fxX76RQ+apb7uRm8rzPReYV70nBXrmprrG6iYVbqX8V4oWMtHRtRu+hroEIq7F7T
 hK7sNuCPAvB8g8mlAMf3rPDAn6Y1cIRztxXigOS9W+Esrqp/Eg3cnR3++FbLFNJlK84XWoMEH7C
 agIDImSOzjO0SVbCfVj0Gf0G1x31O4xIWCGlSgYBlArFZlDID+SZY0pUm4VRE2MrlU8ufnADzOL
 m8BffDd1CPwXGVrqxtLKjx23zP8q9jbgnKqS9swv9kPwpLwSlwny+XwA93rWJjS5LF1BNgk4iLz
 kLbH3QUx3lLr818QsoiVj+h2eE3jvqQfZUyUJpbaybG27x+W5pr6xFzk7xgFHRgTfT3U4KIF0GU
 /MpT1B681mFnx3kjHgMg+TQP2iZyz1FXR8+mFobxpwYfzHeRsbCUv2QxnTcpbwXXBxZaDy3G3I4
 9KKlJkqcTuz3GSKVwErU5QPe0=
X-Received: by 2002:a05:620a:3714:b0:8b2:ec1e:fe24 with SMTP id
 af79cd13be357-8c3893ef768mr859428185a.42.1767883553341; 
 Thu, 08 Jan 2026 06:45:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwxcTdCeqYmfFw81rrVjX1o3tZ6HAubMUWOlK6ohdXbyRzc6ZAmRhgkWfEBnW4WJG0MWoThw==
X-Received: by 2002:a05:620a:3714:b0:8b2:ec1e:fe24 with SMTP id
 af79cd13be357-8c3893ef768mr859422685a.42.1767883552810; 
 Thu, 08 Jan 2026 06:45:52 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382eb8ad930sm16527261fa.28.2026.01.08.06.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 06:45:52 -0800 (PST)
Date: Thu, 8 Jan 2026 16:45:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] soc: qcom: ubwc: Get HBB from SMEM
Message-ID: <you4xijwc5g4ngcnhxm4ecn7opexnsdfayvd5wiiqpl7734r7w@bdkpjqmlzxre>
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <20260108-topic-smem_dramc-v3-2-6b64df58a017@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108-topic-smem_dramc-v3-2-6b64df58a017@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDEwNiBTYWx0ZWRfX8w7AM/wFyz7p
 4ooZ4A0jNv5jhSf8R0jf4++1QnJ+618Yx+Qq4QzwqiWJ2198Kejv3oJje4ypnUzkYQ7hRQOrE3j
 U69MAiSgNxjlsHFc6az94nNcnLTAeAZPtTEoLliokP73DPjr9ejrbqz7A2v1xajsb1oVcPnIY0+
 wzKW/RmEYsqEBZWReErykLndFX07pR/aBNlVOq7AReuB44dg6jbuxo+epQul4Ww4ZRAtnsnlI6v
 J1D9zdqYUFHoE+IeCHr2xjUNhscLktC+KsDgn9pU5Rjm8KZNV5eNfJhu7boUFs6KiKtZBKbz/Ey
 g/xcH2aRNjujwW45JdG2LMvIdYvkMxVbZ1TbG7Mh9B0F4sUF8GDIoDJYS/ppfYCq5LHI0oAobj4
 e2ipSi074ppLWnvBXKwTnrAVXluUzwCyixxPjDyda72om0XUwzvNs4Z3WTOQEenfoPVEBZF5nZr
 LZjWzITRaq4c2VzKwkw==
X-Proofpoint-GUID: TgMelQ0317NL363y6JwMSCqfnhmHdUyE
X-Proofpoint-ORIG-GUID: TgMelQ0317NL363y6JwMSCqfnhmHdUyE
X-Authority-Analysis: v=2.4 cv=XMM9iAhE c=1 sm=1 tr=0 ts=695fc322 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7S24nFsuF8Kv7I6KVrkA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080106
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

On Thu, Jan 08, 2026 at 03:21:51PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> To make sure the correct settings for a given DRAM configuration get
> applied, attempt to retrieve that data from SMEM (which happens to be
> what the BSP kernel does, albeit with through convoluted means of the
> bootloader altering the DT with this data).
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> ---
> I'm not sure about this approach - perhaps a global variable storing
> the selected config, which would then be non-const would be better?

I'd prefer if const data was const, split HBB to a separate API.


-- 
With best wishes
Dmitry
