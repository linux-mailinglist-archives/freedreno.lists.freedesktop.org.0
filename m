Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8583C0D5F9
	for <lists+freedreno@lfdr.de>; Mon, 27 Oct 2025 13:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5839210E44A;
	Mon, 27 Oct 2025 12:03:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="J3XNqeZl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 664DE10E44A
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 12:03:00 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59R84dnV2232075
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 12:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=MBKzjZaWWFsbgsj3/CgK2NUT
 dutBHRTWeINDHOpYMbw=; b=J3XNqeZlhxkCJvGfLJNTlPaBfV9/CW2HtblJjmTw
 wRroR/5jC4L6SPeM6hu8dYCPr1YG1PXcthaPvEdK2Jo4qWv81iMEJj6NPj5fG+n3
 jdoYOH5HUR2Bh5T6y1joAqTgpaC2Fh1g/Gl3j/FIxQn+RM7vZI0rXXiWyxaln6f5
 8g35D0fOza4qFPToCFXn8QLjTnpjb+EpY25xi/g8/21RKwhhy6pk/ODcOG6WoCIA
 tTkUkE/QT0GgW64m+E2bhl/mlL62BRgFJLym3vufLyOiYHwfEMlgUNyjIVp4qNiF
 gELwQnCsr1HALvmHLuBcD51VX1h/0tj8VhDV4tLukeR+ug==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a24wn8nrv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 12:02:59 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-780e1e71180so60237537b3.1
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 05:02:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761566579; x=1762171379;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MBKzjZaWWFsbgsj3/CgK2NUTdutBHRTWeINDHOpYMbw=;
 b=CpPqgR3/LBjzdN8C6I6TikXETBKIh4eLWTQdrsHPZhK3fVJQM27UJeCy3Y9P/0AaW4
 vPPXwcQF8ZpPdHdowW4w6aNUelHiKIQembkZA5+pA6yI+JKSZmuJKd9jfYe3dns+I1KO
 Ga7p7iJUpUuS2n1dXsUGLydthP5m6mtb851ujkKTX1+wPBPjlTYtZ1zXbll/WMQjGQj9
 pUas4nt6N1d9MdbJe6VRx/EBGzSJ+RfDWKSjZTTwncj6FZAmzhgBy+M6c/qQxFpPu+a3
 U29a/eRjF71e8EP+WvWUzpJulrJhhYBklnmIz95YA0B9YCubVlVG2HLlmrJXm3Y3CQuC
 KZTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzYJfEn+FzCrUI5hDtdyAr73md3DUW7p5ss0LjmjIpjQPUsSj10kVXUhcEhGc6+Dfh9sHV+Fqhbeo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBUHQ3TvoyaUNFqIiVb0pQelH0RGLsTOmlZQWkvy2nEqXS4AWA
 05kG2fdsNI4UZwkOAMBrNWtYqVBizHjX9dfJY95To4IBCG53hHn4A3MU3OOl3Ml0GaZQB9ZL+AK
 hsopHjWsb6DqcTuTICHYbJC520FGaLUkZrpA7HB0peLmSZviV5IG/2y+uOBeOFHsLOAMlGjY=
X-Gm-Gg: ASbGncsZSmiE1AUeegf2r6Nt7DMle2V4IQdoOeHEgvXEaNF4tSrtIMZlxY1VWv76TwH
 fg73XoQgo82DJPI8UjFnqzjYVUQtK6HSv2O/gX7Kpk2ffeXQSvP7aa6v6KFUxge2Ek5boyXln7u
 QImkBLspnMpxWDdabChwCljlMuC4VR7au8lYe+FHye9u/1gxly4FhpMBnQGHLu3UkuB+Bv+wsdR
 PCkVHlzs+iHXRtLkWRVz/Csh8JEhfLH4QIFgaQc0GhdfreOm5kF4WRbRTWeQ6pbogZ0nrh0oqzE
 9RWq0f5hSDqjInlh9BJzIcBUCYFdzz/CcQq6+SV78HlMrfIl7NHrTzcIkt9t0t8ez1m7K2Ontm+
 puL14fsVGFvCURUz6yWCzJYPFH36Ief7jzPX/TcVmeghSeyQLfMFEx3Z4a4sKyiXLjPQUXnJ4hh
 2U8ajlnxQslmSI
X-Received: by 2002:a05:622a:1920:b0:4b7:a62d:ef6f with SMTP id
 d75a77b69052e-4e89d3a4691mr416787211cf.64.1761565947274; 
 Mon, 27 Oct 2025 04:52:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGavpCWYKjWaaA8w0dxfApMsNHDEaRffgbBB7gQqEAsTlkalhABoijtu8cBYGS8qrORyH9nbw==
X-Received: by 2002:a05:622a:1920:b0:4b7:a62d:ef6f with SMTP id
 d75a77b69052e-4e89d3a4691mr416786941cf.64.1761565946775; 
 Mon, 27 Oct 2025 04:52:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f41c3csm2271056e87.15.2025.10.27.04.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 04:52:25 -0700 (PDT)
Date: Mon, 27 Oct 2025 13:52:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 3/5] dt-bindings: display/msm: Document MDSS on QCS8300
Message-ID: <drmrkeukgua3w4p3jixdwq6dvj4xj36vvgk2kvwvhpqfk6le5g@tschh7rpsg4a>
References: <20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com>
 <20250911-qcs8300_mdss-v12-3-5f7d076e2b81@oss.qualcomm.com>
 <20250918-spectral-seahorse-of-witchcraft-69553c@kuoka>
 <b745c515-2264-42aa-8d92-663efc7f6276@oss.qualcomm.com>
 <6c195b42-d994-4d24-9c40-48d8069304e3@kernel.org>
 <rkuihu3pmhexeahfch6j7bvwn5rn4ecccbhamluh7fas5qgaup@av2foeiwmcz3>
 <8a6861a0-f546-475b-907c-65b691d1d340@kernel.org>
 <cwuecyparlinhtdqckff7vdqpkio2kk7dwemzfao6qkhnuzhul@mfyqdphfvbdg>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cwuecyparlinhtdqckff7vdqpkio2kk7dwemzfao6qkhnuzhul@mfyqdphfvbdg>
X-Authority-Analysis: v=2.4 cv=XIY9iAhE c=1 sm=1 tr=0 ts=68ff5f73 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=CcKo3yaoeUO6NfmZTnEA:9
 a=CjuIK1q_8ugA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: e17kFKQ02iHBrbB_aDC14zYSTFdVlywl
X-Proofpoint-ORIG-GUID: e17kFKQ02iHBrbB_aDC14zYSTFdVlywl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDExMiBTYWx0ZWRfX4NRy7+lLZYfJ
 b1FzfEiYmwLr1Rl4vP/MJWAkRqtoRbdXBQLSvvtAyjtaVZEzISBe1wqDK0981dZGms74fVgqQuB
 qeMiBO7MNWVaEZVXFyksg36pTIhGKShRFMKMxyNSTNHoMFc1EV5tFLJmV0XsYD+vNXn+E7pvH7h
 6+czts4oojDF57hjBSKeeDLa58rDFOGGBWrEXem1c9Bs9c3lDkaZlB/k0V2AtOk45hvcoQfQoG5
 hEzMIuZcYjuZjs1sIhBuOWe3yBj6u4bor2prqtU24dcrYz2mwQMz3iZww/Qnr5lqnWQC77DIGvb
 QTS68bGYRAjXhCVa/Xrp+VDlta0mjNVh/vt5P3ik6ZF8oIzw6L/TxV74AaGVcQAkDwj1/ioUCWg
 Dk+J3emcENwRRL5FkJX96JAhXD1qBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270112
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

On Wed, Oct 08, 2025 at 10:40:39PM +0300, Dmitry Baryshkov wrote:
> On Tue, Oct 07, 2025 at 03:43:56PM +0900, Krzysztof Kozlowski wrote:
> > On 27/09/2025 08:26, Dmitry Baryshkov wrote:
> > > On Fri, Sep 19, 2025 at 01:34:39PM +0900, Krzysztof Kozlowski wrote:
> > >> On 18/09/2025 13:14, Yongxing Mou wrote:
> > >>>
> > > process in other patchsets and in my understanding on how to describe
> > > the particular hardware block. The changes were reflected in the
> > > changelog. If you plan to review this patchset once you get back from
> > > your vacation, that's fine. If you don't plan to, I can ask Yongxing to
> > > send v20 just for that number.
> > 
> > Solution for me could be to ignore Qualcomm patches till they reach some
> > sort of maturity.
> > 
> > I am not planning to review this patch, because:
> > 1. I already reviewed it, so not really necessary, but even if I wanted:
> > 2. It is gone from my inbox...
> 
> So... Should it be resent to get it back to your inbox or should
> Yongxing just restore your tag on the grounds that the changes were not
> significant enough to drop it?

Granted the lack of response, Yongxing, please send the new iteration of
the patchset.

-- 
With best wishes
Dmitry
