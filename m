Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 388969D2AF8
	for <lists+freedreno@lfdr.de>; Tue, 19 Nov 2024 17:31:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 271EC10E682;
	Tue, 19 Nov 2024 16:31:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XZhY6RQp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A1910E681
 for <freedreno@lists.freedesktop.org>; Tue, 19 Nov 2024 16:31:46 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJBoanj025238
 for <freedreno@lists.freedesktop.org>; Tue, 19 Nov 2024 16:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xCX2FC0uA5UURirp6iZwWYlTD76/xPsOUSdYUmbgDx0=; b=XZhY6RQpaiv3NVWh
 yB8RWuzddyKFJqW94f9ahd+BZCEJp3Q0/hf+w2SIelyVEEau+h0+CrqPhqYa8zGI
 oKKZSUVAHUXiNK01A1ZOO1vz45DxiL0TOGvrHFTxJzjZuRmvDX7GbqgE+Paq8D50
 +NrjJW486G9H2zGxOFTsew8rePN85FFp1e009thMZplMwqjnCNR52Z1eWPV8+d+i
 WUai8GVao1XCrakEz/KzgWRhYyNh7/q4X2ZkAZ6yhw51kbAr/bVxC8qiET+iZ5/B
 0iL+6JtB+6ZCv26oeJCDpLlgRCbHrvl5/2wxw6GCnMuqE5LTl3/yFM29CbGDJbdI
 qABXyw==
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y933vg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 19 Nov 2024 16:31:45 +0000 (GMT)
Received: by mail-yb1-f197.google.com with SMTP id
 3f1490d57ef6-e38aae1bdb8so2754666276.0
 for <freedreno@lists.freedesktop.org>; Tue, 19 Nov 2024 08:31:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732033905; x=1732638705;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xCX2FC0uA5UURirp6iZwWYlTD76/xPsOUSdYUmbgDx0=;
 b=afVyWFMZDNUKWwWIr7PlXzDVM5DZoKBjmRnjoc/KrjwBLx9lc2ueo84ezbMrKzYm+A
 6s978WilHYF2vZWpWrWgMurep/lgHCDSy4NvvtfyGIwt8sbmpq/h9Y3vXcBPT7Pe/rHQ
 O1xL7wXTyDya99jM5FvoZIZee71P1Q6Sh1ZAQszkw8Tkbw2i4zJ2G+QqjvRy+JFHjgFM
 GDZvI+p4jyDZ/slynpIgmKfOXBKgv6a9xjnm7zNEkZIvwj4B07GOmLDLVBpjHk7s4N+V
 bovpVRvq6hG+YHXLYRkU8jbWNVHPitydPyk8gJq2OofKaDOryeyDfid2mQNYPK8xx8Yw
 BsyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCHlpW2IH200vYAK/vIccLRVftPcSZT81ZmXTYcPtolPzsazdVB8+ULcegxFJk8kwFSkUAcjDkEDQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKHPww5EE6Bsrb92uzHEsjhV5NJc/tOypzJJbZevLZkFu7nyRi
 zz+A+OlDXQu01uYDZZgnYOVtNL6Go/PEY12DtilmDY0CGpwqfcjcHMizS1HiVq1DfCSGsryykGX
 FONdNJJuIO/oHBCaDtuJ2Pj3jSl9mdySlZiR4KAUAini5hwKy7sgYwMxw/5ZH+aw0KJ/4ecaJ/f
 RjdudMV/uu++gypwtvDtvma7CHfmJ2u7SxpffX36jSeQ==
X-Received: by 2002:a05:6902:c09:b0:e28:ee2b:34fa with SMTP id
 3f1490d57ef6-e3825be2196mr16598618276.0.1732033901826; 
 Tue, 19 Nov 2024 08:31:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtFkQK4RfZ8dCB1KjME9j8wZMJgTpHRHPYqkJstt8GrFJQHblJESaJIY3zrk0a0tM3r0A6Obo2akW3hgMJ4Ls=
X-Received: by 2002:a05:6902:c09:b0:e28:ee2b:34fa with SMTP id
 3f1490d57ef6-e3825be2196mr16598586276.0.1732033901526; Tue, 19 Nov 2024
 08:31:41 -0800 (PST)
MIME-Version: 1.0
References: <20241110-adreno-smmu-aparture-v2-0-9b1fb2ee41d4@oss.qualcomm.com>
 <20241110-adreno-smmu-aparture-v2-2-9b1fb2ee41d4@oss.qualcomm.com>
 <CAF6AEGvD95RyUXDBjgmoefgO6QyeRw3tpa7EG1MLFKdxcoZ-4g@mail.gmail.com>
 <5a959c08-cc90-4a05-88b2-e1ee666561e2@quicinc.com>
In-Reply-To: <5a959c08-cc90-4a05-88b2-e1ee666561e2@quicinc.com>
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 19 Nov 2024 10:31:30 -0600
Message-ID: <CADLxj5SvwUxgkXOrayyuJo-Jw7LQnV4vOoFW93unPwxfoMpMNQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/msm/adreno: Setup SMMU aparture for
 per-process page table
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: EkFDH8W-b4PmUY9hiU3aryj5_56rbKRw
X-Proofpoint-GUID: EkFDH8W-b4PmUY9hiU3aryj5_56rbKRw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411190122
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

On Tue, Nov 12, 2024 at 3:15=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On 11/11/2024 8:38 PM, Rob Clark wrote:
> > On Sun, Nov 10, 2024 at 9:31=E2=80=AFAM Bjorn Andersson
> > <bjorn.andersson@oss.qualcomm.com> wrote:
> >>
> >> Support for per-process page tables requires the SMMU aparture to be
> >> setup such that the GPU can make updates with the SMMU. On some target=
s
> >> this is done statically in firmware, on others it's expected to be
> >> requested in runtime by the driver, through a SCM call.
> >>
> >> One place where configuration is expected to be done dynamically is th=
e
> >> QCS6490 rb3gen2.
> >>
> >> The downstream driver does this unconditioanlly on any A6xx and newer,
> >
> > nit, s/unconditioanlly/unconditionally/
> >
> >> so follow suite and make the call.
> >>
> >> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> >
> > Reviewed-by: Rob Clark <robdclark@gmail.com>
> >
> >
> >> ---
> >>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 11 +++++++++++
> >>  1 file changed, 11 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm=
/msm/adreno/adreno_gpu.c
> >> index 076be0473eb5..75f5367e73ca 100644
> >> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >> @@ -572,8 +572,19 @@ struct drm_gem_object *adreno_fw_create_bo(struct=
 msm_gpu *gpu,
> >>
> >>  int adreno_hw_init(struct msm_gpu *gpu)
> >>  {
>
> SCM calls into TZ can block for a very long time (seconds). It depends
> on concurrent activities from other drivers like crypto for eg:. So we
> should not do this in the gpu wake up path.
>
> Practically, gpu probe is the better place to do this.
>

Thanks for your feedback, Akhil!

I've yet to see SCM calls take that long, but we don't want that in
the wakeup path, so I have no concerns about moving this call to probe
time if that works.
Based on conversation with Rob I merged the two patches through the
qcom-soc tree, so they are expected to show up in v6.13-rc1.

Let's follow up with a patch that moves the call, once -rc1 is out.
That said, I don't have any means currently to test the retention part...

Thanks,
Bjorn
