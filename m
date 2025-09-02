Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A97B400B6
	for <lists+freedreno@lfdr.de>; Tue,  2 Sep 2025 14:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756C810E6B4;
	Tue,  2 Sep 2025 12:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AOUDiaID";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F062710E6AE
 for <freedreno@lists.freedesktop.org>; Tue,  2 Sep 2025 12:35:04 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582BEZJ5031782
 for <freedreno@lists.freedesktop.org>; Tue, 2 Sep 2025 12:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=B4rVQpxPPO+FQPgP3B3UuvMg
 XoWmixIq4Cskx+zX+jI=; b=AOUDiaIDOm5Fthrt+eQBaDoLAMOABN3sm7UL2qPI
 aZWN6UlGTDdR/90xc5qKg3qwW1RNpaDUwKQg8b+5iXIbOLHkLElDTkD4pOZJNVm+
 I91o5Zoa6Od63CX4a0F+4hwKGx9IXX5l3BauAwj+G4KRcKkaa9TPYYIcnZ9osNeU
 4TfcMruhuwyghHnfw1F957otT+rOHSr7RqETecK1kds0tLWiwMl2EF0bLZjoV1v6
 Ffu1QKlH7D2axvr0YSaUIkGADq5HgsgYljt0ZG2wrHmgtZdeYjnld7wjA7WAWalt
 YhiinRjnYyxmreETv1UTnpD/qdja/yJt4BmoIEH7SrCeOQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48wqvw9gme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 12:35:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b2f9e8dca6so116351201cf.3
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 05:35:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756816503; x=1757421303;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B4rVQpxPPO+FQPgP3B3UuvMgXoWmixIq4Cskx+zX+jI=;
 b=nE1JKT8vtwbvFd5qhUfegxx15++RlCtUxZbg/LjbaPudzX/831ljFBt8eW4gm5R5yM
 D+y0jFurHyNk29dhAmizEfCNjhlmqJutjIIYR1Z2auiJJSDeS1XcVS++GkuobpHmxwv1
 7UBXkHKnO4UHCLR08gJ9CtzbehR0LTfkroQuZHROLP0h9aGxt218KGaQuz5081jP2qsk
 vS4xbvvw6Cbzx00tjpGx4W73UDauLIuyVOrbDksFTrfrJyK2f/aNi/fH8tqZunQ26Q0T
 Hsh7KnY5G7LbGQjJG3tAy/7oBL4OPQmRZKhk/Kehg9VOy6eeWi/3NuWuJLsyyVYKysv0
 NaOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfaGB6u+ZthFZjFy6fFArx/EQTp5qFiblQs2m6ja17trTwN8BPSExRx2PTnRxkuokVe6mDOVYX5V4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUxeArhDf35XqHUiqfBhyz9WdPQrZxTdQAxfx1eA2/vxvw5UKG
 jYL7q6vnqTl83vSxYJDTzgmg6IiPbTXlzG1jmO60w70Zf6RhTC7sfRF8jzfUaQfUKjQ2ELlM2mi
 fMwpsnPhdpvs03PkLjvI+s9CPl/geS/fXZRbpUo5rOyY7BExn+dBofV8zLDSJXHVqe+unN9s=
X-Gm-Gg: ASbGncvGH7+Z6J5v4MFWEdnFdAVFFznn8CKaDk6cBloun17ioGnXJYc0gyWKa4KqzNu
 U5rcB+VfUsvtwKt2v8cZCPOXMig3/r98/37eWdsCecncGlgaOuY+4ZVRuUJ0zVyQLD9WOF8K3PI
 tFHtNB7sNdiA9z7eVrWNiMwWTpqRWJF1+hQpjkyAHf+v14FQ5/Kf6p2efxOTOSUC/p0eONMCPRZ
 GcPW6PK+RMVDvOFajdohuGXLThi9EA8bUfj6L1PPhL6Yni2cf3UncO38tdeUESXwSXeLlsty1ET
 /zyWlA5R1R+EnfVRoTrl1HaMhWTlB2F5Fhrg/+C4qTjgqRTOxTDwk+sfhTz7d9rcI/Zx4wHv1Xw
 TIUhmXvO9RDFAyJoe5qeciI9dA0CaHRhuuNEYih1SAVmoJbhOqS4w
X-Received: by 2002:ac8:5d49:0:b0:4b2:8ac4:ef72 with SMTP id
 d75a77b69052e-4b31dcd0d89mr141080171cf.65.1756816502593; 
 Tue, 02 Sep 2025 05:35:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGU/aLTJMFsLAMJ+zNuNGOEzmGzhvygt22y0Or38v41tO37Dhmnsn2U9YWvwA5+Rbfi+EGYqg==
X-Received: by 2002:ac8:5d49:0:b0:4b2:8ac4:ef72 with SMTP id
 d75a77b69052e-4b31dcd0d89mr141079651cf.65.1756816501921; 
 Tue, 02 Sep 2025 05:35:01 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-560827a71bfsm672243e87.129.2025.09.02.05.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 05:35:01 -0700 (PDT)
Date: Tue, 2 Sep 2025 15:34:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/38] drm/msm/dp: remove cached drm_edid from panel
Message-ID: <z3erghqmjodsqbkkzzxtdt7ca3xw2esj3jqsshouipqu2mqvx2@kwxqs6d2ntuu>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-1-01faacfcdedd@oss.qualcomm.com>
 <otmy4kttxflsxkvacwdsqynck4nqeww7jsxaq2xwjtlooxnhvx@gmpezdliskck>
 <5b142910-81e7-462d-8933-70705334ef0a@oss.qualcomm.com>
 <yarnaujunszlfrbduakodv7n63wjgh6og3t4qowhu3n6tz6fmn@4kb4crd5rqq7>
 <d7141b57-fa3c-49ce-9830-8310a58b9581@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7141b57-fa3c-49ce-9830-8310a58b9581@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAyMDAyNCBTYWx0ZWRfX8DaJLzRgO0iw
 DvzFfEHRclumlIlA3SgHIieuWplR/g21nfS9OIKRuEnc0CymNxrAsthx3H1KuBMolv89oLsUnQw
 MnI26K4W2FGSXwXjsgTS4jUCV5naeznp1wdefOylHSPa9r7Vx/A/R4tHw5WMzPZtedQqgGH25my
 Iy5sZTt+dM1Sh6OwXB0oMUqDftE9Xzi+BiVNrWUr8Dz7HKAsedicBZSXkRAq9CinLg/fk5LY+1Z
 0Qp0qrM6rOgJ+MWBp7H4MXwvYmc9BVlzoNESd0GaEWRxbCatjEd3avj54qbxATI9n0NSDT/2spj
 246k+NYpItLdvZcX7F82U3NZh+mAm1QlgBODuVY3QSB2iPIeY2n2ERaUgy9a7X+9ANM29d/tFG/
 dv82KHmY
X-Authority-Analysis: v=2.4 cv=WKh/XmsR c=1 sm=1 tr=0 ts=68b6e478 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=pUvFZNViTmPBewPdAa8A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: ONaifSVzk92yFnCjkpjtVnllkmybJ3Ui
X-Proofpoint-ORIG-GUID: ONaifSVzk92yFnCjkpjtVnllkmybJ3Ui
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509020024
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

On Tue, Sep 02, 2025 at 06:19:11PM +0800, Yongxing Mou wrote:
> 
> 
> On 9/2/2025 5:36 PM, Dmitry Baryshkov wrote:
> > On Tue, Sep 02, 2025 at 04:42:18PM +0800, Yongxing Mou wrote:
> > > 
> > > 
> > > On 8/26/2025 12:41 AM, Dmitry Baryshkov wrote:
> > > > On Mon, Aug 25, 2025 at 10:15:47PM +0800, Yongxing Mou wrote:
> > > > > The cached drm_edid in msm_dp_panel was redundant and led to unnecessary
> > > > > state management complexity. This change removes the drm_edid member from
> > > > 
> > > > Please see Documentation/process/submitting-patches.rst on how to write
> > > > commit messages. Please use imperative language instead of describing
> > > > the changes.
> > > > 
> > > > THe patch LGTM.
> > > > 
> > > Thanks, will update it in next version. Since the HPD refactor series are
> > > unlikely to be merged soon. Can I separate out some patches from the MST
> > > series that don't have dependencies and send them individually to make it
> > > get applied? This would help reduce the number of the MST series.
> > 
> > Yes, of course. Please keep version number monothonic for those patches
> > (e.g. by telling b4 that it should start from v4).
> > 
> Sure. Thanks,  I want to confirm whether the patches should be sent
> individually or grouped into a series? They seem to be logically unrelated.
> I was originally planning to send each one separately.>>

You can send them separately.

> > > > > the panel structure and refactors related functions to use locally read
> > > > > EDID data instead.
> > > > > 
> > > > > - Replaces msm_dp_panel_read_sink_caps() with msm_dp_panel_read_link_caps()
> > > > > - Updates msm_dp_panel_handle_sink_request() to accept drm_edid as input
> > > > > - Removes msm_dp_panel_get_modes() and drm_edid caching logic
> > > > > - Cleans up unused drm_edid_free() calls
> > > > > 
> > > > > This simplifies EDID handling and avoids stale data issues.
> > > > > 
> > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > ---
> > > > >    drivers/gpu/drm/msm/dp/dp_display.c | 28 +++++++++++++++-------
> > > > >    drivers/gpu/drm/msm/dp/dp_panel.c   | 47 ++++---------------------------------
> > > > >    drivers/gpu/drm/msm/dp/dp_panel.h   |  9 +++----
> > > > >    3 files changed, 26 insertions(+), 58 deletions(-)
> > > > > 
> > > > 
> > > 
> > > 
> > 
> 

-- 
With best wishes
Dmitry
