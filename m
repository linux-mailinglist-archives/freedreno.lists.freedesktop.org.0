Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C1CC0E0A0
	for <lists+freedreno@lfdr.de>; Mon, 27 Oct 2025 14:30:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0081710E494;
	Mon, 27 Oct 2025 13:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YpQxaR9N";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663B810E494
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 13:30:50 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59R8sEtX987780
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 13:30:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=VuMvAMd2Yn5uPAiVWdHf+qc3
 ZLlZWtjBdo/nxvtzJAA=; b=YpQxaR9NbkuVebTOxqLZOKApJ8xkEoYp/PY3AysS
 RJuRsULcLLPC70w1zr29miA5OJze9zBxX2T53Ayx/QErjy2BFl9qK5jJmgOdRI00
 rxUbNn4VGB50UexWm3YXEE7JqQJUwlD+iK32YOlh3xexsqpJQTpQ8SJdACw/SlNU
 qFOtCSKe3p0wf6T68HNljU86vrqd0204RCMg+5EDVm/QmkHv7s83BPxGwB1UU+ek
 pmu1zlIKtXiR/icB+rltZMLYZd39pQ3kDXQe6hkpvNRQhkhfrLjX2pxBFHLzp6lC
 6kwAq72L6rmLSENFaVfgz2Jxb2+cajhz36Mi/BQzV0eT7g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a1ud1t457-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 13:30:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4eb7853480dso150258911cf.0
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 06:30:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761571849; x=1762176649;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VuMvAMd2Yn5uPAiVWdHf+qc3ZLlZWtjBdo/nxvtzJAA=;
 b=kcWwdAZRPql4+TFUXPRkLrKXQIt/3EP5AnPdohCQY48+CEm2QAL23F5H3YrDB39Bmh
 RPaLLj8tccwmos+mos1G2x62YkEqHjtFZPQF+V2WplfX59Sg2054jBDunwZr1265+BVb
 mlOoD9OedEm4y46iYdgFInGamuu8p2WjzIcDCy+aT6SvqWuDDJHnNQtxeGYhZRIe+T9h
 7qZW4l9HoFJ5s/UqJpN6LG0YbUnplUr1PNmdCaILEs1YSnbb+ydWvgBZSQRJd782bR1Q
 uGxAhJSt2IR0YtBtkmSvXNZN6SbXbDCHM/7oqTIudHg/3rmCvKVqmKffWhH2Ntyuygof
 R1yQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjnzBtR5MEffPpUeuUhfdeZLrgwKlZihFU3Yo09u32rjczQ+dvxbmukog6nafnPqpy8ujbpdwqqxQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYjURl2LTymI85GEKkfl1QkDlPsjirTF3K5eFmfgEgX7013swc
 4QhJGOMeRJPv7+Qvxu9/5fHEsrL2mxdEbEtsxxJ+yxDntp4jeYJnE23OmpI3EIKoPOZClQdZ6Sr
 4YBGxA+QWJ7daMR8it7ZMo9aMCp9b1DR+Es+1FZmY5LLoBEtFJEr2nxWl3YMw35AlkIds3xE=
X-Gm-Gg: ASbGncvYVlcaxha9uIKoIxtALS8dp3oab7e+CkIzPoibAe+YS8zK6PGheBsZ13CzvsC
 8xJwMMp3FgVSOk3QdJLxDitAAe2oEJd8Szdon0FGDWTzYAxoP65/F0T7M13MOR3RlYXA2cbiAQX
 +uL+CmeNjA0XTlgj70/bNNW15CVfLPnsOF5IVHD/tT6hWIdTYaZAVx7mN+dwJrLOK1HyGakkHYK
 gt+r270x5KQcMoNQQt9zkT9YL4W6liH6CMdxOJzYyUGVDgXvahaRs63c4Q7wPBsZ+QP5YNt1VOK
 xN7Kk/rk/FkwVsX6r+dtf5sVNNI9jwYpm44uvl27+O5A0mkRZSypvwjWQBkMMRqM4wkUf7OvN4h
 PD5et8HRQ3yWVF/BPtkNvX9EASDGdQ1BAI0kT4PQbJ02gDIHgu4fTCe9yz5U5u8EsHYe40G6Gvj
 9vOGCC5bpJhZoG
X-Received: by 2002:a05:622a:4c8:b0:4e8:b88a:c6d7 with SMTP id
 d75a77b69052e-4e8b88aca6dmr348435941cf.17.1761571847832; 
 Mon, 27 Oct 2025 06:30:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxmrtPppf/+owHCkx0AjMgN9OBqs2zLqs2+SSWeaytTVGUaHm8qCALLSko1kZT3wz56Y32Sg==
X-Received: by 2002:a05:622a:4c8:b0:4e8:b88a:c6d7 with SMTP id
 d75a77b69052e-4e8b88aca6dmr348433731cf.17.1761571845947; 
 Mon, 27 Oct 2025 06:30:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f7444bsm2344459e87.85.2025.10.27.06.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 06:30:45 -0700 (PDT)
Date: Mon, 27 Oct 2025 15:30:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjiey <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 10/12] dt-bindings: display/msm: dsi-phy-7nm: Add
 Kaanapali DSi PHY
Message-ID: <2pyurzgalnjwsxqw7qhfguebps45ne6iua7gvioagz554ra6ru@nhe4tnmabqp2>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-5-yuanjie.yang@oss.qualcomm.com>
 <em666johhzrluo5z4t2nu5jo4yuowegaemlrursvczx2zze5o5@uakt5j22ygwm>
 <aPsYVUjyPru5FwPe@yuanjiey.ap.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPsYVUjyPru5FwPe@yuanjiey.ap.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEyNSBTYWx0ZWRfXzkcHEZfzT+r1
 HBjdvvq2jK5A0f/Z+eMriMHrWG63evKA00zCBaA6b3Tj2qYkIKJqtOAO0P+Vd0OwJ6vrFNKkjW4
 2UBWTs+NYSiXwjgtAaMqUmVe2bL3qQP05ouGruYUwcSyJIe/1S4b+xQ1AhEEZCbSQ8N9dqz+IuJ
 8xo9ehOVEeISOaGvnh0ENp825du2zSyZrZt6UPkBeFg+mvDg9Dm7lUoXgxlpaFvLKm0ZqQ8hqxP
 l0ptdbzFNNX/61c3U89CN7k2tT1UWyyjsu7nMqmz51RkWSraryfjtgO6z1aloZkAAGviarZSVQG
 4RLCmPo+IwlYSxZOGHni5WXn/CK+lXgscp2XAnPzb1i8JwH74aQjpyeYxY0MztCsMLTRBwaylTF
 dzEXsXXFMm7tGQ4euH39Vj2/B0ny0g==
X-Proofpoint-GUID: EVUudvhzbInsBevZGU5hmp2OnOAgM9Tw
X-Proofpoint-ORIG-GUID: EVUudvhzbInsBevZGU5hmp2OnOAgM9Tw
X-Authority-Analysis: v=2.4 cv=UqNu9uwB c=1 sm=1 tr=0 ts=68ff7409 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=dXhcXtSbZMlcZ2ZPzDcA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270125
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

On Fri, Oct 24, 2025 at 02:10:29PM +0800, yuanjiey wrote:
> On Thu, Oct 23, 2025 at 03:16:31PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Oct 23, 2025 at 04:06:07PM +0800, yuanjie yang wrote:
> > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > In the subject: DSI, not DSi
> OK will note.
> 
>  
> > > 
> > > Add DSI PHY for Kaanapali.
> > 
> > Why?
> 
> DSI phy for Kaanapali have no significant diiference with previous version(SM8750).
> But some register change make it imcompatible with previous version(SM8750).

It's either "no significant difference" or "register change make it
incompatible". You can't say both.

> 
> I will give this reason in my next patch.
> 
> Thanks
> Yuanjie.
> 

-- 
With best wishes
Dmitry
