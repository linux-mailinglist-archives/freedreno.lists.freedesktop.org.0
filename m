Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A52FC16ADF
	for <lists+freedreno@lfdr.de>; Tue, 28 Oct 2025 20:54:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBFED10E06E;
	Tue, 28 Oct 2025 19:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PtrDBg+z";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YHrc+n4k";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9035010E651
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 19:54:33 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJlMXj2615932
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 19:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2afrDbATXikU2P98B6c0J0m4ZgHNuW/14p+YdDAqu64=; b=PtrDBg+z1RJoSGZw
 ngQn86Waw+T2U8zDWNrDutSLoe8j2rGOU4ErW+W7tYqptFgesimHadUVZrlht1ng
 CmUKNwb7ereJCI5Q4e/KyV2GRswAopZAku1w5o5l4np9fDq5tIY4CfPbmpZRWH63
 uA1o7cSLf7Fq7TbmIiSeq0pR7CGoHjqgD5H4SttoWiB5yd5o7x4ElY5GVsDiN8+T
 BOZtA5o+WBjmIKIvr1/jXlM5oAajD8efbYjRmeinshLqFUGNz2KNfzhu2IrHFyxI
 dvrhDN3guCj5uHHPZytfGhC2ApcnimbGGdEFEXC+2Haci447ir0uEEI7XhUhjehI
 M2Lj6g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a0g0fb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 19:54:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4e8aafb21d6so159098611cf.1
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 12:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761681272; x=1762286072;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2afrDbATXikU2P98B6c0J0m4ZgHNuW/14p+YdDAqu64=;
 b=YHrc+n4k2Zs2POjUDpEwGd1MbKTZBmKxl0LQ8XcnLr5evfFM3xhJIY9TZGpNzyCVCZ
 S7my0a2Qc8W8SEEIsJNmb/yu3UWnK8hNWRvDMFqIFKwULpQs9QhqUzTK6QpSC2VQ5o3l
 JSP6r2Jqj6W49yJQmiLW+aQ49PElMkkQhohU9Rt1gJ2AQmYz+ac+2UEhy3RFHUhy7Fhl
 kXNKva2zaHa/G9zs8I8CyLAYr+lbFeVxfYL2EWAsYPLyOFjnMtpXQXHmOxK/24IpD9DE
 O8TpsFo8JagyC8Fjul5EZLDdo96ZEPeGOU7M1fnzf8rpUclHP/VeVr7jeNX4O7WDotft
 cqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761681272; x=1762286072;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2afrDbATXikU2P98B6c0J0m4ZgHNuW/14p+YdDAqu64=;
 b=PMEjQX9MjmX0mLk4+7u9et/CB7Kzd5OBJoDrDy+ZfRegMbW4Guvj8gwg4NMoJaNOoI
 7AkE/GZK3VW9P1ZTHJpUJZIBAoRpBtIvvksaHDbhuWe9dAin4z5dm9V+QwXTZKQD1JXE
 e1ObhIZkVRKqUl8jeaFpOgvdvcJES+snPbFxJ6cyFPpoq3DABbUp+YGLtQEmGhveN/dc
 rKl5TaexzI1JoB34YX9uM1kFm1Z39XtvtR1HI2ZY69/s58cTtPE7A4+eJVWBB43kob/3
 vRwR3kLNNqxwMmW4sbL2o3O02+jrPKM3b8zxpjyDJt+sFrXnei5HLHXPArrUIaeAG7OI
 s4tQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSkdJ3aWth6RvC4Ngg19wRGLwV/9JkOkUGMbf1Vzl7xBu6E8AgRlblxxgH+WhANtfGLXBwlxdYHZE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaGnFAif2Bk0W4D31cgv4bfjcoal8+zN77+XkyHt0efuuokc25
 2+1eJx8+9xhgQ33lDdcxxVdfWSrjU7Jp9gnHLxti/PEijduz9XtkIGmYFh2AMwyn/dK/481uBUh
 f2JohDxa2MlszRMkFz6/a6b14+VY6wmtqbwyV+kCs/nDQn/U+In7y0VzcbdKHbgKVd6GFa5w=
X-Gm-Gg: ASbGnctU93PYJkCsgZqdMDFlJ2cypjpn9LjUAD0svQde2oTbiZDgD1PKr1x9QvhWmag
 zEYfDZ/DKE8Ou5QGVYEF3I7kngpvefdTcF9+9PkDbO4oAN69YeqeELPDD3vtCtDs1Y1HNMsXL13
 UDcXwJFthq4pQZVDJNG6pHHpoUqybqAmyuZxqrqbykwKt/gR/4cHGX926MdysB6XrbaeE51XpSu
 s1oVGMdCL3PJvf0kVBahuG0JtRY1VFryZSa1u97ezAfYuZvEv2GlaSCtnsmYhobXObzU+lC2cIG
 y/8DjKdYETRLR2jDVmkEoumYy4LkuoiQDtU8jNRMlLk8iOq8ZbKuzPw6L+Zn4aTI0lSbfuj+yu4
 kPfMdZQ0cvFeNWMNkfE1IRM30481egjbsyXbj1eNEIMrt9mdARCz1qMVL9bTRi0AfBKVLtwiw4z
 1LvcNM5ACIe/mC
X-Received: by 2002:ac8:5754:0:b0:4d7:bf73:7641 with SMTP id
 d75a77b69052e-4ed15bb30c4mr5992901cf.17.1761681271917; 
 Tue, 28 Oct 2025 12:54:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFp30l/mxiO0/x28DsAYuBVAOl6GnYN2VrIZ7Onq+dUKIoHEjlqng8hPS5TJz3djMSRii/+MQ==
X-Received: by 2002:ac8:5754:0:b0:4d7:bf73:7641 with SMTP id
 d75a77b69052e-4ed15bb30c4mr5992331cf.17.1761681271214; 
 Tue, 28 Oct 2025 12:54:31 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f87f14sm3312685e87.112.2025.10.28.12.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 12:54:30 -0700 (PDT)
Date: Tue, 28 Oct 2025 21:54:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, simona@ffwll.ch, linux@armlinux.org.uk,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, patrik.r.jakobsson@gmail.com,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 robin.clark@oss.qualcomm.com, lumag@kernel.org,
 abhinav.kumar@linux.dev, sean@poorly.run,
 marijn.suijten@somainline.org, tomi.valkeinen@ideasonboard.com,
 alexander.deucher@amd.com, thierry.reding@gmail.com,
 mperttunen@nvidia.com, jonathanh@nvidia.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] drm/fb-helper: Allocate and release fb_info in single
 place
Message-ID: <dlvkkogiueskk4emkwdkpst4pvqk54ordyuqobh3hzqckuzz3f@gguhnqagpvwj>
References: <20251027081245.80262-1-tzimmermann@suse.de>
 <3d1bc193-fbee-464a-b62e-ceca06d8829f@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d1bc193-fbee-464a-b62e-ceca06d8829f@amd.com>
X-Authority-Analysis: v=2.4 cv=HvZ72kTS c=1 sm=1 tr=0 ts=69011f78 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=zd2uoN0lAAAA:8 a=EUspDBNiAAAA:8 a=G-TusFqAXxKo-7y7638A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: tI8y-EUD6DFZ5Okly4DcvElPHHk4AzKr
X-Proofpoint-ORIG-GUID: tI8y-EUD6DFZ5Okly4DcvElPHHk4AzKr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE2NyBTYWx0ZWRfX4z65SUEigV7A
 1c2rJLqGogq9HEXUGNtdUJ9l5TKEvjgS0bjCVP58aUvpcVgTGVpH85rmVRvM1EmIbCCUvi5MkrE
 TNDHp+OXfgKzUU7fsGffF5D9lK2ZZO25lMhzr4ocnqXJxuwhZCvAi5UyITA/U3wkFDVZMwN6YKc
 FGMkWqXJ7pvVux4b/o/1sL9NIIlWec3ccHH+L6y7+mz6gJPpfRG7lxwPSWuDKiI5l8D1UyYt/kc
 kvkSGLmusgAU+j/OmNYELODBnUB01FoHMKWN2MsFmm6x7LySnzdKkrsTjy2j9NYbreYdSlxsiZq
 HD0dthbhkY/9bq4Mi/Zf1XpiSXZu9egnCxOFcKMYwVTVrY5DgXRTVpKGkkIbMThy5y7eiO9ur4H
 n0jEUjYIhg2sRHiXNmyTpzUGf/EY9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280167
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

On Tue, Oct 28, 2025 at 08:58:10AM +0100, Christian König wrote:
> On 10/27/25 09:12, Thomas Zimmermann wrote:
> > Move the calls to drm_fb_helper_alloc_info() from drivers into a
> > single place in fbdev helpers. Allocates struct fb_info for a new
> > framebuffer device. Then call drm_fb_helper_single_fb_probe() to
> > create an fbdev screen buffer. Also release the instance on errors
> > by calling drm_fb_helper_release_info().
> > 
> > Simplifies the code and fixes the error cleanup for some of the
> > drivers.
> > 
> > Regular release of the struct fb_info instance still happens in
> > drm_fb_helper_fini() as before.
> > 
> > v2:
> > - remove error rollback in driver implementations (kernel test robot)
> > - initialize info in TTM implementation (kernel test robot)
> > 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Acked-by: Christian König <christian.koenig@amd.com> for the radeon changes.
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # msm


-- 
With best wishes
Dmitry
