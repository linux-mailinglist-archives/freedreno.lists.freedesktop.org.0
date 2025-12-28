Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C19E4CE48BA
	for <lists+freedreno@lfdr.de>; Sun, 28 Dec 2025 04:48:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B429D10E14F;
	Sun, 28 Dec 2025 03:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RBwh2Cl6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vu1S6eX3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8509E10E0C8
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 03:48:38 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BS1afft811315
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 03:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=G5ZtyNhbwgn/S3NWbt1gNJl8
 aOXPg2uVBnJuiZYIEQM=; b=RBwh2Cl6gv8S5hJuNG5hcQzUg1oqYqLxV91bNY2y
 ihfJ4XNtZkVKBz0Z4efX6uXaYdB5YvhRCgm7VNu3Da0MiZMwE4fc4m1ukcDmB+YX
 QuYSYrmU1E/KpdTman+FDwda60vaBj1iYpyMICpFH3s9DdJlFi9OTVPN6S4zfI7g
 p2AcfYGCmg2bTnWnaxt21x/wOl5iokjaFr+GUmPP2xI/aaTs6R7ajtfUT4iqBnmc
 DnHxkzI4PaV7FMBcA4vhzv1sbqRf7SJovfjoeqQi4h/uq4ki95n7OSg34GxHpw57
 m5kVVGG+kgbYyGENlWIkLQBD+CXqK/Ag3gmMcC/iMkJxpw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba4tnssw8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 03:48:37 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8888a6cb328so208484546d6.0
 for <freedreno@lists.freedesktop.org>; Sat, 27 Dec 2025 19:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766893717; x=1767498517;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=G5ZtyNhbwgn/S3NWbt1gNJl8aOXPg2uVBnJuiZYIEQM=;
 b=Vu1S6eX3t0FnaYJH3LA5hhoaZyLx4QNqdlB2CY+nBZ6+PIeWsfZzSAQUEDaRX0YuYt
 PxyKduLcZ9Gq1SuZt3mdDWEyThP8m9TWQrjOKS0pD88SyIVuRz1MrkM3dIMtIO9irZR+
 zSYWlnJy27NKcPyjsk9igw3u/jFVfiyE3Gq/zgs8Q3CUUmIDKyhgfBMmoAKULyFsS+rR
 IbLuuz2TBJxJQ7G0e/jmyooePS0m1MTGU+7jaCUD+zRq1AwBR0QAz9TJivIJqtTYyoBS
 TJiNfD+byUQ/lJOWJuvNnoEZou4WVsYbyHOhhCmug2caClg1gs1wJtY4MXWDtkCVF891
 QDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766893717; x=1767498517;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G5ZtyNhbwgn/S3NWbt1gNJl8aOXPg2uVBnJuiZYIEQM=;
 b=ViSJzzdCRHplqOj8dQnWxnz4Kfl0saIQbUPRK95Ubbow5XD1XHZKec/jEIBKn78xej
 FBCO1sCQN8Y61Qcp7IE+w0ixDA6vsSQcnTzMHcSPdetWedp2dM4m8C81EQyJTu+tA4g8
 28mi6uAyltc4ifl2lHUce/dOuzCfkWB1arExWxkba4cRHiFSEkyhsjRGsTXvvKaMZWv6
 N5T/y2Aum9P09wduHY3PYFUOBEIRPrvwYnNlHdbkeBSD6LPVnIP/GWRYEoWusJiktZ6e
 4ESbqpedlTZqxUZIeKsyycGD9PDt9VX6UwD6XhmJdNbE8kU7Cq5oY2Rk9LfB/I4RyGCZ
 wjSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOqkyngl+Bl95TzaQAah3bGKrwhEXYUUMuFkVg8YmP1iIYm9/kcpCyU6vwUyRa5MvZXCAhq7LLNjk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPWAG4Gqw//qL7NaiEKkX/09KfToU7DwrWltC79L+uBq69Njhy
 hFvt7q4tv8K/khF9iExY6L0qREL1Wjkw4dBRu/EpXWHGA/FG/us228yFnz7HMdgZ2nBHAwcOXMM
 SyJ29ULuor+FR0c4ss7xHPyrs8yt3U+uXU06irJVDlFJjL9P2iX27o63up3xdDINuPyw9bFI=
X-Gm-Gg: AY/fxX4PNoVu5ci5DA1w7oD7oTOKRj3bmVPUaR1auBezed21Dc26BLdtoUH90toKxQW
 Tis+S0SGN9p5WrPqazWtlHrNAyJk54bNIeqvM54PqyxPf4TShUSU0C3q18sxS/TMgej1CrC6Cyg
 EkkpKsnTcxWz4n1dRUsaXRelf5N5RgjZ6d1on9j+4d6/U/51FdygXXH2uJuNTFlOdPmIStRBwah
 Pjw7v6r8CKfdX2/yMc5Q7WVvkBRaENNhi33wp4MJRYTwx0kpuLBFjytyrY4iZ9Wt7IR9LpWpic7
 OgwhBoIVtw3k6SSFcelogKls01UBeBdfR8abI60PT7n1fez2GV4ajtSSPJLyvkhkp57xUUdJmcs
 WDqpOHupHq3xi3J+FCwVDW9+H5D6JwF+ajes4oC2Gmo3/lsd/UnOUZXoXcBhnCTdoiqd2A8aqke
 KaEBa1HuwHB8yhVLLg/FgCu2M=
X-Received: by 2002:ac8:5fc4:0:b0:4ee:ce1:ed8a with SMTP id
 d75a77b69052e-4f4abccf0b4mr376484021cf.16.1766893716858; 
 Sat, 27 Dec 2025 19:48:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWl5R2B2w9eNeTAdexpt9iS61TBLyp3dSOAsh42BGWIL7uO3Pn0K3kDuZ4F2wO6bCoLEUjJw==
X-Received: by 2002:ac8:5fc4:0:b0:4ee:ce1:ed8a with SMTP id
 d75a77b69052e-4f4abccf0b4mr376483921cf.16.1766893716473; 
 Sat, 27 Dec 2025 19:48:36 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38122680689sm65495831fa.44.2025.12.27.19.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 19:48:35 -0800 (PST)
Date: Sun, 28 Dec 2025 05:48:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Teguh Sobirin <teguh@sobir.in>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] drm/msm/dpu: Set vsync source irrespective of mdp
 top support
Message-ID: <dxtktuo2evbqibblvnxejkex2em62jkbhcvnwxn7iy46me7msb@5scbwuow6stj>
References: <20251224-intf-fix-wd-v4-0-07a0926fafd2@oss.qualcomm.com>
 <20251224-intf-fix-wd-v4-1-07a0926fafd2@oss.qualcomm.com>
 <aUwhqUlM3WBqQwZb@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUwhqUlM3WBqQwZb@SoMainline.org>
X-Authority-Analysis: v=2.4 cv=G+YR0tk5 c=1 sm=1 tr=0 ts=6950a895 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=djJBbdDc_AO9gVaMYpQA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: S2AbrWMog9ZrkfPuJ2EaYbPr_G4T4ZDY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDAzMyBTYWx0ZWRfX0fEYbs/cXLdD
 jQY2n3ZV/0/pjgmH9hG49NbAjq/b/ujZgM9MtWIeIhfPaF4/CW5cWv5Rz4bDAX9I0nrDfC9MxAX
 Dptya4lxMRRJh79WBhP8H1H/H2QbpfNPjM6jK0fM+eLSrzl5tQZHyipNT2AqWTOu36Uedm3ujKa
 /CAS+QuQVObIwSSnMhrhSJ5+jWbJQWYpMGp6uf/CF0zadV+TMOS1K5TZVbJuapqaFAgHeO8Kgot
 GhxMZLtVcorekwBkJYTDmeZ0LH93AtLmiKYudw7rr061sncTL3eVYXW0DcpJzn/Lx75Cuw323Zt
 0E86v9HS9AqSuenQUTsoxiwyuSPT1/AS8LZjF9OgYaXw8anjnYrbWNBM7wAcul3HiqpBV/76goT
 GBKNlepDr/1GkKn9ErHXrutGiBXSDVjgjGfxoByOkrRz4gsImMPOTu85xo6s6KiYlw5vOAJk0EY
 M7PKPlS1ZywhZKJbNGA==
X-Proofpoint-ORIG-GUID: S2AbrWMog9ZrkfPuJ2EaYbPr_G4T4ZDY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512280033
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

On Wed, Dec 24, 2025 at 06:26:59PM +0100, Marijn Suijten wrote:
> On 2025-12-24 17:33:49, Dmitry Baryshkov wrote:
> > From: Teguh Sobirin <teguh@sobir.in>
> > 
> > Since DPU 5.x the vsync source TE setup is split between MDP TOP and
> > INTF blocks.  Currently all code to setup vsync_source is only exectued
> 
> exectued -> executed typo remains since v2.
> 
> > if MDP TOP implements the setup_vsync_source() callback. However on
> Double space to match the above, on two occasions:        ^^

I've changed all occurences to 1 space.

> 
> > DPU >= 8.x this callback is not implemented, making DPU driver skip all
> > vsync setup. Move the INTF part out of this condition, letting DPU
>               ^^ double space too
> 
> > driver to setup TE vsync selection on all new DPU devices.
> > 
> > Signed-off-by: Teguh Sobirin <teguh@sobir.in>
> > Fixes: 2f69e5458447 ("drm/msm/dpu: skip watchdog timer programming through TOP on >= SM8450")
> > [DB: restored top->ops.setup_vsync_source call]
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 17 +++++++++--------
> >  1 file changed, 9 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index d1cfe81a3373..0482b2bb5a9e 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -774,6 +774,9 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
> >  		return;
> >  	}
> >  
> > +	/* Set vsync source irrespective of mdp top support */
> 
> I still think this comment is redundant, as mentioned in v2.

Dropped


-- 
With best wishes
Dmitry
