Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DF4C04719
	for <lists+freedreno@lfdr.de>; Fri, 24 Oct 2025 08:08:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF3C10E995;
	Fri, 24 Oct 2025 06:08:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KEEy5YYW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E5110E9D1
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 06:08:54 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FbIM001292
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 06:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5paQZUXoZhbSMdqEbr7oDMWv
 5wYg/eSHa84AvpMQ1gU=; b=KEEy5YYWmGISqZocseXqFvvaaUAPB1sOLO3rqjvo
 KU2JgAV8n6Joarvt+LHc7yBgdWDf0m7m+vEWqORLJf1frTF3vDqE8P5zeMk/5X/w
 HQVRqFAwnYc5vNQES9Iqf8gMP8C4QU2evE0EBL5HaP/16cECqMGIZfh7QDBs5C9z
 wkIDgrgKOtaiBmghZxCT4Z0Ka6NJDAK64YoX5D+4QB01Opv4APoRwOxGU7wFlQyV
 +VZElCAflFA3Qf7Rdn76yUIjBSREdea05oxzw4vYWrOBwkCuKKYCFFCBanWJSVxg
 35BlkTKW8mlwQcLetyJFcvBpWL/ec7QZzMZduNclkrT8Bw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49ym9j2kmk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 06:08:53 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-87c20035ad3so38599186d6.1
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 23:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761286132; x=1761890932;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5paQZUXoZhbSMdqEbr7oDMWv5wYg/eSHa84AvpMQ1gU=;
 b=v5G8Oyudu15sjsNG03i4Dokm6jLxUrxrGJlX1mv5Vow4TWLBkpZFlXYOr/nuvVBhER
 X2wmK66+eL3sgzdrZBvqsFywp0YGh/JHUrUW66/CYe+nGgqMRVkxNPOkpLN98EdQpRlt
 Y/4l9XfnlaudihU2CYDUS+oVcY/WZvCXd+KXC8/lYX5tW74u3cH/JUSZviV9H0GhzVUE
 zVvI3gN1tONtfCMMeKvcn0RsjQqeIIUL9FqC6i7qGSdupeAkG3cItUTFDES5p0ooQYOo
 iymIgHNCuHDolQEiqHOe7x7JDx6ACYTypcGIDJPV1zVd+soIFkxyX+kPZmmxKJJfEzco
 NcXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrx3rpz47SpiZogYmeOAXEX10kt3EYmrM1iroit/nAGY6DCnFlD6osfoMf0kzJnujRgaalrwl2dMU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8/4AW4UEm5zQ5gbYQvUFX5v/euH0m/DCW/6i3WrbT+mITWtgD
 QyH+XExJEkRG8ng/FzGL/aqfnMGZ6ip2n7GizyiI5r7cQrra44IdhCUJVF7bwvtgVgsj9MGmdeU
 d3L+x1LN6/c/l03p9Ew8uV/boCbbxHibJqPYKTyOav1kZ0FZ/uGC534xYEhR87b6E91dW6Ig=
X-Gm-Gg: ASbGncsEKR2+FIXe3Z/NlUejQ/RCctbdv76Drq5kW4Nr06lX6GBqAJpIsBA5ivF8PXE
 tE7G/bkW7BW6PwlmYanfYQ5JdU1QpSd9CcCF+r8mke0lNa2yau5x9T94wha832HsBirERt0s+pT
 PDIn0gIr489ini/Q4pZs6pq/RyadAsrj48SlF8MOoaEtzwpKRMMVrOq3IJfNkhD6rkTzqSWox+3
 KVl94GauZfmEUFOQJq6oMyChmW512UBIZjX6OtV1GLVm7ETtKkIed6Lwd34ayzCXJIXKDPktDEP
 quj4vqEe0pO+dpmX376Z98PEv/YtyTmzRWsw8nHjGADjwC1r/NmYQHAc4xapk8G6McljFV/u+mw
 s9VzCKpamerKOHbwenqKw7Fx5VEimOKlO0J+WJX4xzETjFOLL3L0jOu3wF/TI
X-Received: by 2002:a05:6214:762:b0:78e:2582:fe4 with SMTP id
 6a1803df08f44-87fb41405f1mr18971176d6.30.1761286132405; 
 Thu, 23 Oct 2025 23:08:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJfims6BmldfbNUzzEmlDV12NK3CNrXycYwMc9WdMoAhC7GnzxeZrG4DxKcu5+ArENqYaIDQ==
X-Received: by 2002:a05:6214:762:b0:78e:2582:fe4 with SMTP id
 6a1803df08f44-87fb41405f1mr18970886d6.30.1761286131954; 
 Thu, 23 Oct 2025 23:08:51 -0700 (PDT)
Received: from yuanjiey.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-87f9e7f52e1sm29575846d6.51.2025.10.23.23.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 23:08:51 -0700 (PDT)
Date: Fri, 24 Oct 2025 14:08:40 +0800
From: yuanjiey <yuanjie.yang@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Subject: Re: [PATCH 11/12] dt-bindings: display/msm: dsi-controller-main: Add
 Kaanapali
Message-ID: <aPsX6Fh0tiGuUox6@yuanjiey.ap.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-6-yuanjie.yang@oss.qualcomm.com>
 <binhwh2sb72ipt2qhqdmnid2hygdnjx62mhzn2cl4v2do467gz@wkmsvroshkcu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <binhwh2sb72ipt2qhqdmnid2hygdnjx62mhzn2cl4v2do467gz@wkmsvroshkcu>
X-Authority-Analysis: v=2.4 cv=CLknnBrD c=1 sm=1 tr=0 ts=68fb17f5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=WIVAG7BfrJY6p4e7JxwA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDExMiBTYWx0ZWRfXzjpDzn++UJjx
 dkOa7JWPNI0J0DkPexM6lyEJsQjxQNxcnRU5sv+sRevyXIL9BnP7ou5C6wSG9UejZcVPtFUohAB
 wdx/35cC8t2U9KWwaLQPzoYxYqgsg1s5VCAY2kRJzm1X5Vta1cvr4TobdmmyRmoesZW8e1j6n+M
 bxF+itSW2NELuH2pjUxock3IWaMD6ot13zuM5xMCirzcyKUXCjA44uA4TLumriee6bWRF32gqSu
 ZrXrth9+hVleboqhUXw98DCnhEhv7/CUOcaXsFVp2cv2n4lTHMVZE++UtB++8Ejz/9BmjurLIKX
 j7udICjieBYKo74wxaTqNX29KXrOl+vziWkjN7CPey9cRM5yObKsMctn6XfHtWcyQBBvWTDPvmm
 DxGIU1Yuz83slRQE5cSgd0isyD7tNw==
X-Proofpoint-GUID: BfTjFTVtgcJlkhg0bGkfc_if0kgKl0IQ
X-Proofpoint-ORIG-GUID: BfTjFTVtgcJlkhg0bGkfc_if0kgKl0IQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510230112
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

On Thu, Oct 23, 2025 at 03:16:11PM +0300, Dmitry Baryshkov wrote:
> On Thu, Oct 23, 2025 at 04:06:08PM +0800, yuanjie yang wrote:
> > From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > 
> > Add DSI Controller for Kaanapali.
> 
> Please say something more important here. Why do we need new compatible
> for this platform, etc.

DSI Controller for Kaanapali have no significant diiference with previous version(SM8750).
But some register change make it imcompatible with previous version(SM8750).

I will give this reason in my next patch.

Thanks
Yuanjie.

 
> > 
> > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > index 4400d4cce072..536ebf331828 100644
> > --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > @@ -15,6 +15,7 @@ properties:
> >        - items:
> >            - enum:
> >                - qcom,apq8064-dsi-ctrl
> > +              - qcom,kaanapali-dsi-ctrl
> >                - qcom,msm8226-dsi-ctrl
> >                - qcom,msm8916-dsi-ctrl
> >                - qcom,msm8953-dsi-ctrl
> > @@ -369,6 +370,7 @@ allOf:
> >          compatible:
> >            contains:
> >              enum:
> > +              - qcom,kaanapali-dsi-ctrl
> >                - qcom,sm8750-dsi-ctrl
> >      then:
> >        properties:
> > -- 
> > 2.34.1
> > 
> 
> -- 
> With best wishes
> Dmitry
