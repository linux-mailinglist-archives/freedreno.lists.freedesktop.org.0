Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1B6C5D910
	for <lists+freedreno@lfdr.de>; Fri, 14 Nov 2025 15:26:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C26FA10EA94;
	Fri, 14 Nov 2025 14:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iWo3bcC3";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kPn3QHU1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE6010EA8E
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:44 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AEDtkqM4117467
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oYcCK3JJ+gnZ5HcGe+mpDomdAD2aNje5VtVBHtWbOOk=; b=iWo3bcC3ZNrUWRjX
 2IUWxfT6YurkED+W36NkVM6p5mRMSAlP5pEAUc4g8pgVhLJltP/N87WF9QfsZstO
 W43REzzraefUFLZbK9vT4WOoQlecVwjrm7Fyb+chLFlZBMQe3dCNFjsEChaT0SnT
 oTfozyJgoUtaukqAa+S0YX9cJ8UE50mRomV40pjdcBZhJoB7njYlmeFuU3EsMcpn
 4N44N6BfBTia2UIm16Rqy7f4wAugYovvnrWFFuVGyJs7rNViAKqnFg+JQq+D13r9
 GAHM0q2YRWbtPx8nlvoUnOENP42e4yI5R8wMCztyv1o7f+8f6V1p0q2ej8ESa45p
 dd+YtQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ae5r7r2ws-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 14:26:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ed74e6c468so30042831cf.3
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 06:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763130403; x=1763735203;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oYcCK3JJ+gnZ5HcGe+mpDomdAD2aNje5VtVBHtWbOOk=;
 b=kPn3QHU12diQGIlUxiNVUZyrpn1mihmbwtSHjh2vk/ZeBv70h9efP1gdz661c3ZSUA
 ViFiAvc+lW5vS6PzET/EVvuYJWWX1HzxSayy1mJUxESkRts6CVzOK0GbeervKyIUcBIk
 NG30vtm1XD4NZL+V76krVC58EheahpODRxV6JM1pLmatRTQAWQiJoZrH3ZHeMG5LTLPe
 snkDuQzNT2ixvDLBHX1Py6Lx8OjUH04bO4JJErX4V+S9rxZMf7ixH5qS+yDkLIeC/rcU
 C0Df7pbKHZZ7diG/ZINxKty9/nVmnNR9hndlk03w1jcCEuLTLz07ZYFlHvSWLZvvvluo
 u4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763130403; x=1763735203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oYcCK3JJ+gnZ5HcGe+mpDomdAD2aNje5VtVBHtWbOOk=;
 b=hWymNGtDqAfVtjEs2APE106a/L+FnEpGbQxpbpA14Yb1lYM9eWXgY9WO/fAlnIMZMp
 dvl5oAstIJ+Wuu2oB782v33EAvK2qsXimvLufX2elPBcBkzcRmABSNOBsfgxmbIxG0l5
 SM233Hcdjsqa4e3ZAUk1356hLruX5eOhmaDNqCnnrqwY1RjPcz3+YQX9770YtLar1z50
 hzoLD1/9pvQf7a1cZRiSvicQsiRqz4pnAbEBakffnTa38TbpvQy/ftRHeYJyeYfqWlJi
 ciWuLbNqsYqVQeT/0I63N82kMNtcnKQez6d2gtC5Luy2cEtD9+HovFXUMauLz7do6m4t
 gUgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUL78ApB/UDUBJLgUypO6lO7wUannVBQ4MNQlkRZ4d8qNrBD5mNk5kGhCNrUsY3FNtm7ALvL4N/On8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy13B/tbCzdYWDxmk2Vb8S7fSzIrtWXAxTscyXxBG6B+1R9FRYG
 d/qHgguJiO1Fhq2Y4+D88Lpwl9hOnJxTMsAnmu8jlG36F4lhkaqhH/b+PoVy+JHqfAzywDTQ68x
 ULtUvxrrDTMDim1LvBEbgFtgP+/fB2ozCgrMPj41SAdFK0Z47MFJyorUgU+8ebMGGccvqLa8=
X-Gm-Gg: ASbGncuazplCFs9RZv/NiBHiOFW7wQV+IvdBMeYPZ6816D8G9KsLA/vxnZWME0//n2D
 toFe4PVUBS3fRqpUBy0HKzEzkebKrUKpB+Ua9OKCS8sxZvuBk5OwOg5EpbyeQ7wIi+Dn4/gkts5
 8cjpLOeqAOXzmDrhMK25BBqxhH1hl4upmYrMZ/ZSIYydvTLTem76k2kyOnxlwpp9eHjvI2ZLCZh
 Apbi/LWFh3GG2XN5JFytrccgZBqU+EYMVgMYgFUrxtgqwbrqyJtljVQgtDrdRLm4CnG4ofq07wj
 hXvCfsKNQTMpBmv8TIvWq7COXZhIUyCnJJ+nnemcALQ6KZWB5gMVrLWpilwroSC6sUm6T6XXZVt
 uJWu8HGw8oaCN6x9adlWmgvxyH2b2IbP1jQBRGE0U0QdTg4VpQbdPZIvl5TFF9or07D1N8uZYSq
 adn2ZIxKAXMFC/
X-Received: by 2002:a05:622a:1a9d:b0:4c7:130f:72ef with SMTP id
 d75a77b69052e-4edf2046387mr46509881cf.9.1763130403016; 
 Fri, 14 Nov 2025 06:26:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGP8IG1VHGQkfhssKeM/niBRRbZpJbVXyfQrYpHpEoNStRfxBC0CED9S3kxQ/qIeTZ0If5NAw==
X-Received: by 2002:a05:622a:1a9d:b0:4c7:130f:72ef with SMTP id
 d75a77b69052e-4edf2046387mr46509291cf.9.1763130402400; 
 Fri, 14 Nov 2025 06:26:42 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37b9cee0cabsm10318821fa.40.2025.11.14.06.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 06:26:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/msm/disp: fix kernel-doc warnings
Date: Fri, 14 Nov 2025 16:26:33 +0200
Message-ID: <176312947283.1737000.10526075040707074259.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251111060353.1972869-1-rdunlap@infradead.org>
References: <20251111060353.1972869-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDExNiBTYWx0ZWRfX5+D6ZpD4vZQh
 Tqc83C28AJIjX5jUPfXGF8A4XLGLj+yr6RUxO5XGz7yMEH5Khl+R7h3jEhuxtOh2Y1y6mcjLblx
 9mWquYN/5QOeDvYJWsyS1IIBF8AWum8WGZdwnMrtB2QEukWEodAqOUekyc4wUi5h0KCK/mdA8B9
 GwtCc2FKDIuGAyp6WM6g9xCClIIHRNb+nE5s4hF/H7noO9D/aOOwqm/8nv6YGkXUbDMSICmEZbp
 zWJHalG1xjE2TAMAcD2cbBQA/nn/YJ4VO/a3MOc9fDXf0VIMhvpR2TJ2BynWgkroKhgSklMNVKP
 PO3eyORb8CcMNy0m8dX6SJy1OXPz6SGuXToXpeTeqNWl0wHXWOLghYu4QiScl0U6qdzovsi3F2T
 +tHnlcat1CGPWqVPra+Cx+bd9CKPCw==
X-Proofpoint-ORIG-GUID: c1C2uXqcbHSkF1pp-olC3fVvolT26h1z
X-Authority-Analysis: v=2.4 cv=BJO+bVQG c=1 sm=1 tr=0 ts=69173c23 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=rK8zvM0c_VZnkeQV2f8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: c1C2uXqcbHSkF1pp-olC3fVvolT26h1z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140116
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

On Mon, 10 Nov 2025 22:03:53 -0800, Randy Dunlap wrote:
> Fix all kernel-doc warnings in msm_disp_snapshot.h:
> 
> msm_disp_snapshot.h:53: warning: Function parameter or struct member
>  'blocks' not described in 'msm_disp_state'
> msm_disp_snapshot.h:69: warning: Function parameter or struct member
>  'node' not described in 'msm_disp_state_block'
> msm_disp_snapshot.h:69: warning: Excess struct member 'drm_dev' description
>  in 'msm_disp_state_block'
> msm_disp_snapshot.h:95: warning: No description found for return value
>  of 'msm_disp_snapshot_state_sync'
> msm_disp_snapshot.h:100: warning: bad line:
> msm_disp_snapshot.h:117: warning: bad line:
> msm_disp_snapshot.h:125: warning: bad line:
> msm_disp_snapshot.h:142: warning: Excess function parameter 'name'
>  description in 'msm_disp_snapshot_add_block'
> 
> [...]

Applied to msm-next, thanks!

[1/1] drm/msm/disp: fix kernel-doc warnings
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6fd0a29a674a

Best regards,
-- 
With best wishes
Dmitry


