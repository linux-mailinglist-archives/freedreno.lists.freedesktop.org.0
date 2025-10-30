Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACDAC21A0C
	for <lists+freedreno@lfdr.de>; Thu, 30 Oct 2025 19:02:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D24D10E0ED;
	Thu, 30 Oct 2025 18:02:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C75Z2qjU";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GHtCn495";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A596F10E2B0
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 18:02:18 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59UFjITs1693583
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 18:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=RheHgo5pVuvCVdocn9ENbXAi
 PLiZAdlGRP3oP5F0h2E=; b=C75Z2qjUoMsGdoIq+At1x0n8FOS3Hrzy2R6drmju
 eNqHssKq+SuqRZeOGqSu57BLljrDLuBxYjeKsmD0dFqwlNSvzfdkfX8W9+tdbsEW
 ouK6mQDYttHoYvDvx0yx7T3sSLLXPhplvhCrPcKWuIhLLFPYjt7fpZrFHVepawsB
 omVIbrXJeqvvdJ4BV0H683ffQ1TuNJmdIoSNdmeBJcoDatyfP6lx+w47fZ76RrLI
 Hhs1GZA4zelYxuuM3xs7oS92TSNgIUWtXzVbrbI/9P+HKz/oP9nNcYPLRcNrPRk1
 Vkhc9RM9nf0ocH9ooR3sK5flM4VC/Q18+0v1vVohntiouQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3trv37js-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 18:02:17 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id
 71dfb90a1353d-556a28eb409so2704688e0c.3
 for <freedreno@lists.freedesktop.org>; Thu, 30 Oct 2025 11:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761847336; x=1762452136;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RheHgo5pVuvCVdocn9ENbXAiPLiZAdlGRP3oP5F0h2E=;
 b=GHtCn4955nuc3IcIvHdvKzQZaNlOdn5/lzSdZbrr9nEwc8v16WYPdAsBc4E8cUKoPV
 uguWFiW2tdbycseuXx0ILcb4X9Ar3FCZLR9dUeSwomIUvFaayVTljHTZZqbXSs3TgJpo
 ZmYGprBYdDeKO4qQI/QLCs8uMSER+NaFOcjEwupTDpkMxrqmO1GGkCgNoPqXG4O9aF1k
 zxJAzI09aEKtd05exApLg2sMNOYwtjIzq5xUeYhGguKBmYVpbQwpITLz8rxGMKqrgTeJ
 Yt35GEJzOjP2Udmh5BZncGY+4bch2vlY2zRqxz4bt3bpu6eaV3BLmymAQF/4WyRtxM92
 8bgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761847336; x=1762452136;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RheHgo5pVuvCVdocn9ENbXAiPLiZAdlGRP3oP5F0h2E=;
 b=kq3qA6TnN40IwqyNYqnPS8pWadSBarphOr4qAY8cKQWsWVvZg/PPmD/dlGYCYpkcFA
 FccNr51WAFPTui6pVlurKiGV8B1wyn3/SQXnRzrvd8pd0FmvK1Nj0yLFN5wY+Jku0eLJ
 Wa/VrwqJnOY8xYdx9bcerPkqwcxIYn6AhF6oaU+Nu/Jaz5oZyHYiTFFlEHrwxl8e0S3g
 wQr0VQQdgSfuof+B0AKF0fM6im9wxrnGNAtpbFpb/Ve9WpezWucVhLclqI5kPIW4ZTtj
 BT3OfkOGvuW6ju0K0736sbdX8jMa15tHcFuepxDyOdry3SJHBMp0KM6kY0JRL670WW5k
 GjOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWx5I5Ttp0xBPlWYHAlNuNH2C96uNE9fd797xTDUlibu5Mpi/Lg0PMvLUi1QLW/AbwmNEDm+zW1d/0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaLkDThJU7iBgrR7waNZBC9nIox90T587TRg0D7ykPmYY225f8
 R1m/r7jnV2XyVuGQGCqZX45853lq107+BpTRKzumZJJZ+TirIMHxZhfDySn8ZBa7iKnlyEhIlYV
 tmO0Bm9NKuwwGjtEZeNhwvNWgtXhbsup+jkGJRmo8O7NiEbugiMw7w9T+jYxCguFgDkqzSSs=
X-Gm-Gg: ASbGncuYZhp/z3Ysg6zSc+tdtX4Io/IRQ0NpK7rBjtyti7I/YQpe1WSdVxnKIEtuA05
 ZxQy4UvIjjL3ZN7MPtociNR4cHBYSRbbuzYoEfuIEslecjAtwYV9ykzWDcstRzaNXdqsUicro36
 qiKVVF7NzpjbhxfrJsRauL0kn6e2mI8VHP0GaZ79kcSQGykJaZFgt+T0l4wNO+k4ZOXhYRjKCFO
 8OlUjustbM2cFINQC6m3VHef7TEsPVnD7GxI+vjhzmBzz8DN2DVtzBjPqPyXw290rn8OEmHzcRJ
 YQfotXe9GbauW40u+aatkIyqD+eIBak5c3I9+hWJ62G7cf2PFddyGcZytXWE0Oqie/+FT7ZI/2g
 MjvstQKhdh8HKBHGFfowJwXhX8e1AtSTkzbQpIqPlksSXhxoTiyzpWDb4DQ4paAq99esYqGrQOa
 SSdPfzrd7+teX3
X-Received: by 2002:a05:6122:1b8f:b0:541:bf69:17ac with SMTP id
 71dfb90a1353d-5593e47e35cmr384146e0c.16.1761847336556; 
 Thu, 30 Oct 2025 11:02:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTUInpRsTJOc8SKFIzEahxJdQTKBRduSeEFhBOHHqnWR1cf+EOntfXk2b22CcXF3blRRpO5Q==
X-Received: by 2002:a05:6122:1b8f:b0:541:bf69:17ac with SMTP id
 71dfb90a1353d-5593e47e35cmr384016e0c.16.1761847335762; 
 Thu, 30 Oct 2025 11:02:15 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378ee092282sm44025471fa.5.2025.10.30.11.02.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 11:02:15 -0700 (PDT)
Date: Thu, 30 Oct 2025 20:02:13 +0200
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
Subject: Re: [PATCH 03/12] drm/msm/dpu: Compatible with Kaanapali interrupt
 register
Message-ID: <br3aukcmx3p2mtowqglcuf77s5xfnfv3eisjexabxhjzigkjno@wk7sqptjn43a>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023075401.1148-4-yuanjie.yang@oss.qualcomm.com>
 <nfekr4vi34ftxzyyf5xv4tsb5cr3tokiyfkerypqjf26dos3uq@42wcn6ji7nnb>
 <aPrre+WXogSZIE7L@yuanjiey.ap.qualcomm.com>
 <st53uwtdow2rl6bvmfitro2dmodxtzfnhyzon4xeeetkkwekxh@ewlzkelq25wm>
 <aQGAvLFkH80Id3p3@yuanjiey.ap.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQGAvLFkH80Id3p3@yuanjiey.ap.qualcomm.com>
X-Proofpoint-GUID: g9jSp_tiLv0naHfFQwFQA40m6NTwUXfp
X-Authority-Analysis: v=2.4 cv=D+ZK6/Rj c=1 sm=1 tr=0 ts=6903a82a cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=4LvRZMndKBpg9nUHPPEA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: g9jSp_tiLv0naHfFQwFQA40m6NTwUXfp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE1MCBTYWx0ZWRfX4NsJqzU08RjX
 mBBYS65l5dJc8U/3qrO2CMaJqbrBQRxo25uy973NuhXbWG52SpTQc5OYQS7J3Q1GBdQ1JfBPuj5
 vnZeAocwguXAjey5KD+mxwP4uq7SDr0vrz/8Vm9L7JvgZWiqlhXSNVIfVvIVBuw8nY6zg1hJhnw
 OxMlmdyUuABi1Ge61zKhPx8qEqMn2ZgORujXf9SSp8Fti+3/1ButNwo1PaAQOB7U6vbKjubOHUR
 bHZkd1GvZqUl2IkGK3499y6MQ68gWUM2dObRaeOEdoXOSUhWPLjpkuAwcAuHoR7ygtr5LNBFdRZ
 VyQp2fjpFEMRYwNm7sbeIOCUccb99jBexDjeWj0A09RY3GjUAztsL3hJZB92nu487+8uVJMSI58
 nijmZ+98rjq0RsUjF9WnSE3zKEDV/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300150
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

On Wed, Oct 29, 2025 at 10:49:32AM +0800, yuanjiey wrote:
> On Mon, Oct 27, 2025 at 03:21:33PM +0200, Dmitry Baryshkov wrote:
> > On Fri, Oct 24, 2025 at 10:59:07AM +0800, yuanjiey wrote:
> > > On Thu, Oct 23, 2025 at 02:59:12PM +0300, Dmitry Baryshkov wrote:
> > > > On Thu, Oct 23, 2025 at 03:53:52PM +0800, yuanjie yang wrote:
> > > > > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > > > > 
> > > > > DPU version 13 introduces changes to the interrupt register
> > > > > layout. Update the driver to support these modifications for
> > > > > proper interrupt handling.
> > > > 
> > > > So... Previous patch enabled support for the platform and it has been
> > > > using wrong registers for interrupts? I think that's broken.
> > > 
> > > I want to express DPU 13 has different INTF register address, so need to add new
> > > interrupt array to let DPU 13 interrupt work fine. Maybe I should optimize my commit msg.
> > 
> > Make sure that patches are structured logically. You can not enable
> > support for the hardware if the interrupts are not (yet) handled.
> 
> Kaanapali Dpu interrupts: 
> INTR_IDX_VSYNC,
> INTR_IDX_PINGPONG,
> INTR_IDX_UNDERRUN,
> INTR_IDX_CTL_START,
> INTR_IDX_RDPTR,
> INTR_IDX_WB_DONE,
> 
> are handled by irq handler, so here enable dpu_intr_set_13xx. 

You have enabled DPU 13 in the previous commit. And only now you are
adding support for interrupt registers on DPU 13.x. No, that's not good.

-- 
With best wishes
Dmitry
