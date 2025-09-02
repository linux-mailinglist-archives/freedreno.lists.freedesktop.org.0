Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B402B3FAAC
	for <lists+freedreno@lfdr.de>; Tue,  2 Sep 2025 11:36:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D101B10E633;
	Tue,  2 Sep 2025 09:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BYvIywrX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D1810E631
 for <freedreno@lists.freedesktop.org>; Tue,  2 Sep 2025 09:36:26 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822S5T5025161
 for <freedreno@lists.freedesktop.org>; Tue, 2 Sep 2025 09:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=zwxseqR+TZhAlHd8nXn4rEVr
 gvLiKS1QfDCvUia9uDs=; b=BYvIywrX3heQ7ne5hRRZ5urv5nl4T7xAfnc+SZM1
 /i5UPcTEuA/pByNJR0mc3t+cw+DdPg8mYjpo8RAcOSuTkTWvJhpcr/BAuzYDC1x+
 rnip3mPByRZc1p/LcON3dNibvaAyzY99svf9HnmOiKPDPJleFdLGcTrDpp6oVQYG
 YBtCVvI1NloXtXqOOqMAPQwzgQVMWt3pOGGwo2GLlWkLvNsfm7A40wUSt179x/1w
 8joq2vla9hDBamSayx3Gjl0H/Mr0E1kpSqZSBgBke1+VmT1z00xLtZQb+j61CVRk
 Iua3yEjZh4VDVx8jhku+r7DMkHn+VWS04c6zZRYzguMKGQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscuybap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 09:36:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b3118ab93aso67538831cf.0
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 02:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756805784; x=1757410584;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zwxseqR+TZhAlHd8nXn4rEVrgvLiKS1QfDCvUia9uDs=;
 b=hi0tkK6nrX28Z86feopMpzkxEdOV/FJ+nuDCUqr/DKTTZXH6dINeFJgy2/38VB4FFg
 Uuuz4OlMcXqO8CWiDOOzfQiGgThh9Hd1lMYSdIENDErv60iNw6nLpBRPd+VxqQmX1KEq
 Hiv3tF/II4+TjuPOrbEtQpPQOuHChtnP7pk/UeZUyRO/nARjNRQ3h4x4nsRc/1p3pEgB
 oddwRoNmkQT9f06i5+4fzID8i5Lm0JDUjb5rdlZbL7Vhr6gZyip6GHailG5eH53wPNYF
 0DKTdcA/t46JHjwlgCbcUbkbQUjLvQnnFjGXGKFOsrw5JhNgAPoxV+4oabMo1WnjI0wQ
 SJ0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUp0m8AkxBZkV4FftsCmyTHTMIeM/T4eEtZSWSbU21Bd6Fwk/UXvwt1VGw60BjCODo6d9l0/wmV/3Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJKxUfhdhm3H8ShHboqQWaJvLItopVTfMeidg6wj3Cqswl1iLZ
 YPSbrJeI4X6MIA8xd0r9TMgp5eMwwBajgTPZU5w+2B1CXZt7HhLrD3gWSI/l7tO4IBp/8K15fkw
 bTel37nq8KkVhHfP9+SgmK4ItQGo3LwtlUEdE0yx1dBDN+DETE0VsNOQo3EXe+gNFliPC/+k=
X-Gm-Gg: ASbGncvH6bqcRVrxKrBfXXkocOxvR7JRoFbcXZRF+mILOx37O4K50ccHWTw8KMQVYcg
 zWUvkRS/wl+RXAi4rV/1vYkJn66c6HoPU+uMmy26DBXwRreY5VS7RJ22MlIXrzvQXtqqXMtsmlJ
 FfjOSNMH9VdCZIx6Kz3KLkmP7ovBAIUPQ/GwJyuta4pYsQDtk+vbvA63pENjl9yvUtZW4VroCCy
 GXM1g9l+8a5qy55rF5RpzefNrRVeuxCWDlgSiSdWj7j2s7NRi2O3oHyS+QMKPEKBxHSHuWzksHJ
 R2APutuag3llLMermkiaz0PAf97qpWeK36x3PK6va4EzOcwkrGYoeEBezQ/QmLgHhxDUMOpNCR9
 IrHuUk8dzdkXniNLwKZKHHY/iCUUNn4aBQIDR4FdZfz/pvG3ITIz/
X-Received: by 2002:a05:622a:5e0d:b0:4b3:459c:6eef with SMTP id
 d75a77b69052e-4b3459c7a6bmr18165941cf.47.1756805784111; 
 Tue, 02 Sep 2025 02:36:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHx6nrwggqsOXBxF3/OABMklDbP3IK5x4SRajgGDGpPKXyjhgzvQjkfyqsdwZoBMZXal4NHjQ==
X-Received: by 2002:a05:622a:5e0d:b0:4b3:459c:6eef with SMTP id
 d75a77b69052e-4b3459c7a6bmr18165671cf.47.1756805783493; 
 Tue, 02 Sep 2025 02:36:23 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-560827aabf5sm544368e87.137.2025.09.02.02.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 02:36:22 -0700 (PDT)
Date: Tue, 2 Sep 2025 12:36:20 +0300
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
Message-ID: <yarnaujunszlfrbduakodv7n63wjgh6og3t4qowhu3n6tz6fmn@4kb4crd5rqq7>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-1-01faacfcdedd@oss.qualcomm.com>
 <otmy4kttxflsxkvacwdsqynck4nqeww7jsxaq2xwjtlooxnhvx@gmpezdliskck>
 <5b142910-81e7-462d-8933-70705334ef0a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b142910-81e7-462d-8933-70705334ef0a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX6JUeEdIl63a+
 EUot8vU/3W/uPBj+ax1lwvNPdHsXfcFgiBtLA1RTu2icEqtWBl6aqWZHNcfcJCG01zt91KyM5eU
 yhBN4dARtFtRrqQchinMyBRTmMRcQtQDvlMT704GBt5Lnn63uacnWE01fG48/P80tph1E3P6sJi
 1Cc+YDypDdOtQuvG06Pk1znqbG6gSnJ8xWxeowiztcKn6tim88HOHvsLq9K+t2CbBi1x40itmIN
 LiEuUQi7tT3d8IyBEWEP7Ohliv39mCR8iPpgZniUW715GySj6wo1i4WisnqLQA5Q3WkN1Dr7asJ
 vZwB6tiwIbKcRzloz6Hh6+dGEd7QLx6l5OQ1LcaT+4zsiXxQedZsei0Mdoc5FcS2A51s4qJg0M5
 vwnUsKrK
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b6ba99 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=kpPRz-UtyBwCQlaFug4A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 5KMDYsnxKnjput8kbdNrwE-VPdpDeY8N
X-Proofpoint-GUID: 5KMDYsnxKnjput8kbdNrwE-VPdpDeY8N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031
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

On Tue, Sep 02, 2025 at 04:42:18PM +0800, Yongxing Mou wrote:
> 
> 
> On 8/26/2025 12:41 AM, Dmitry Baryshkov wrote:
> > On Mon, Aug 25, 2025 at 10:15:47PM +0800, Yongxing Mou wrote:
> > > The cached drm_edid in msm_dp_panel was redundant and led to unnecessary
> > > state management complexity. This change removes the drm_edid member from
> > 
> > Please see Documentation/process/submitting-patches.rst on how to write
> > commit messages. Please use imperative language instead of describing
> > the changes.
> > 
> > THe patch LGTM.
> > 
> Thanks, will update it in next version. Since the HPD refactor series are
> unlikely to be merged soon. Can I separate out some patches from the MST
> series that don't have dependencies and send them individually to make it
> get applied? This would help reduce the number of the MST series.

Yes, of course. Please keep version number monothonic for those patches
(e.g. by telling b4 that it should start from v4).

> 
> > > the panel structure and refactors related functions to use locally read
> > > EDID data instead.
> > > 
> > > - Replaces msm_dp_panel_read_sink_caps() with msm_dp_panel_read_link_caps()
> > > - Updates msm_dp_panel_handle_sink_request() to accept drm_edid as input
> > > - Removes msm_dp_panel_get_modes() and drm_edid caching logic
> > > - Cleans up unused drm_edid_free() calls
> > > 
> > > This simplifies EDID handling and avoids stale data issues.
> > > 
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 28 +++++++++++++++-------
> > >   drivers/gpu/drm/msm/dp/dp_panel.c   | 47 ++++---------------------------------
> > >   drivers/gpu/drm/msm/dp/dp_panel.h   |  9 +++----
> > >   3 files changed, 26 insertions(+), 58 deletions(-)
> > > 
> > 
> 
> 

-- 
With best wishes
Dmitry
