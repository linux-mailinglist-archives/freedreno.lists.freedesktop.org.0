Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 976BAA6116D
	for <lists+freedreno@lfdr.de>; Fri, 14 Mar 2025 13:33:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733AD10EA08;
	Fri, 14 Mar 2025 12:33:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="F5vR35vU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10DD010E9B9
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 10:56:06 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52E9tRxo018487
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 10:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=FzjaEivNGyD1ku745kyGL7WS
 lER8CajMDsn14aZcwOY=; b=F5vR35vULAZmhebVeiVNNRz0pUtqRbCsZX/yzYX3
 BlMnE6lKJtlwsxLo+sB0p20Dn2jlL2sNbqhpXsOOMXMkN6xV9WDd3BkX73UaXlrY
 nxA1+lWKG1gsCth/Egvp8f9cfMhe2dMZP1bDq8rXTMUTk2mJ7ictyztSbmdfIfkD
 sKtFMrFpP4fbscSsUjBCQ5p4PBZ82sFnALW3YqeSGbddBS1Qya+5JsPexsVaRGaW
 1JtQmtR3BnkLE0mcShj06Fcz0qx+KWPypX31ENyDAkGiW12BKABWny4UIYiX+e4j
 o1t6RtByH7PM2giQ6XA9ttAEgRSOX7Mp0GaUPH938+tFnA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2p11mv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 10:56:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-476aa099fb3so62041821cf.2
 for <freedreno@lists.freedesktop.org>; Fri, 14 Mar 2025 03:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741949765; x=1742554565;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FzjaEivNGyD1ku745kyGL7WSlER8CajMDsn14aZcwOY=;
 b=UArt9XEIwKTIeTivHGa2l2riiQ31TShExSXJ4reiZVOt4tY3hZjG98VgEGP5B5tMn0
 XaAgOWZxrfCw0m3AhLeVlXrO1RsjPEgcRtYgrkMrhYCwb64mGWGQajj2qiX+M9lF0AXX
 l5rVTswwjJDNwAZrBSOUPuWXVeS8NIruPWiTqa/RB8ksXHtHKJmQUKBQlrtsLRSWh+wt
 TUAEiRSJ8VzW041eoeMQ9P95Tz/m9/HZjDz9vmhgUtffgmqnZU7hRDLUdsSyRoGliMzi
 o5QMfGaiJ029m6XXbq9rymouJ+1Y6KrT02cHhhw/qnsSdjbr8XrjsyuYDZ3QjO1JPPQG
 rQNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9vom0jxGcs//JIQ/oP8+8lBxM5RvlYzMqATGWmeXfEjj5RLtKH0Uc+Na1gbN8CTTM6WXAJjS6x3E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1vKjM1ucAk3+EfSxhJ35dGb00J4ZBJKQL1fd9cWbPZOvL+Wwz
 UW+0UjiPrMM5peUI3NFxbapha9wkBoGQtQs/AnlH8PcMi580DiostThzoQcCKyr+ZbK+jLp2Bu5
 pQzyLl+jiR5PRB6QxZN7jF4FhZSkxQ1h0MdnFi66hZkBqKi1buCLPX+i/m9t7znYGL7I=
X-Gm-Gg: ASbGncvCwlUucJBrAMksBgsz2yLYp9U15/ntpx9zJM8EEY7+Us3YffsZ+SYFpcVkRWZ
 /s+Qxlsv+bevnm3mUCO0fALartPLRhv4GG+ZT0uHIKDBwJOwuPlkGeEzZ400RLUo7MBmB5qJ4BP
 97XN4w5aguql4911b+HQLh7v/kkPYB+2021amRqUbJogFAGNV3tr4CqpuMzkTuK1lfWH+64P7S3
 jxK0IOPL5iAjI3vtuKu8yKRj5sOza+1kG8k3cqEePRCZHo1+Le6hq+Sv+JcGbmPIcZuDAM32wM0
 +4c+G0mOfUTsskepYroMsCy1bKQ/nFocRcbayRE3NWrdlKhA9Tu2WU6LFm/6PZ1YuPMQvZVaThi
 Iams=
X-Received: by 2002:a05:622a:180d:b0:476:6215:eaf7 with SMTP id
 d75a77b69052e-476c813f762mr29693791cf.19.1741949765156; 
 Fri, 14 Mar 2025 03:56:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+yV16Zmgi1A70mwBZ9PcdiO6z5Tv5gkisCoi1r0ajg/e3I2j7Vl0jSm2ed6kcC/PKpZmF6Q==
X-Received: by 2002:a05:622a:180d:b0:476:6215:eaf7 with SMTP id
 d75a77b69052e-476c813f762mr29693331cf.19.1741949764770; 
 Fri, 14 Mar 2025 03:56:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba7a8944sm495547e87.14.2025.03.14.03.56.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 03:56:03 -0700 (PDT)
Date: Fri, 14 Mar 2025 12:56:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: Re: [PATCH v2 09/10] drm/bridge: anx7625: update bridge_ops and sink
 detect logic
Message-ID: <odaup4s2j7uzjmucdsio2y5umfwwtmn5l6rotu3xwjatgwsahn@sgfpdv56mny4>
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-10-quic_amakhija@quicinc.com>
 <6gdd6p3ca6w2gb2nbl6ydw4j7y2j5eflelbwntpc6ljztjuwzt@dqwafrtod5m5>
 <da9f80e6-bb4e-4568-aa2c-d70383b12e3a@quicinc.com>
 <CALT56yP+UDF1YeotceqOevr_NTeGjDVw92NwtPDgRK6GvvkyHw@mail.gmail.com>
 <2c10d5d2-a0bd-440d-b385-28ce3fea7d7c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c10d5d2-a0bd-440d-b385-28ce3fea7d7c@quicinc.com>
X-Proofpoint-GUID: kvz2tXx4n2llY7i1u1MCy6Omk7aAybgd
X-Authority-Analysis: v=2.4 cv=Q4XS452a c=1 sm=1 tr=0 ts=67d40b45 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=JjDlP3kZNfNiCSxIk8gA:9
 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: kvz2tXx4n2llY7i1u1MCy6Omk7aAybgd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_04,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 phishscore=0 malwarescore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140086
X-Mailman-Approved-At: Fri, 14 Mar 2025 12:33:27 +0000
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

On Thu, Mar 13, 2025 at 12:14:04PM +0530, Ayushi Makhija wrote:
> 
> 
> On 3/12/2025 4:33 PM, Dmitry Baryshkov wrote:
> > On Wed, 12 Mar 2025 at 11:47, Ayushi Makhija <quic_amakhija@quicinc.com> wrote:
> >>
> >> On 3/11/2025 9:11 PM, Dmitry Baryshkov wrote:
> >>> On Tue, Mar 11, 2025 at 05:54:44PM +0530, Ayushi Makhija wrote:
> >>>> The anx7625_link_bridge() checks if a device is not a panel
> >>>> bridge and add DRM_BRIDGE_OP_HPD and DRM_BRIDGE_OP_DETECT to
> >>>> the bridge operations. However, on port 1 of the anx7625
> >>>> bridge, any device added is always treated as a panel
> >>>> bridge, preventing connector_detect function from being
> >>>> called. To resolve this, instead of just checking if it is a
> >>>> panel bridge, verify the type of panel bridge
> >>>> whether it is a DisplayPort or eDP panel. If the panel
> >>>> bridge is not of the eDP type, add DRM_BRIDGE_OP_HPD and
> >>>> DRM_BRIDGE_OP_DETECT to the bridge operations.
> >>>
> >>> Are/were there any devices using anx7625, eDP panel _and_ not using the
> >>> AUX bus? It would be better to use the precence of the 'aux' node to
> >>> determine whether it is an eDP or a DP configuration.
> >>>
> >>>>
> >>>> In the anx7625_sink_detect(), the device is checked to see
> >>>> if it is a panel bridge, and it always sends a "connected"
> >>>> status to the connector. When adding the DP port on port 1 of the
> >>>> anx7625, it incorrectly treats it as a panel bridge and sends an
> >>>> always "connected" status. Instead of checking the status on the
> >>>> panel bridge, it's better to check the hpd_status for connectors
> >>>> like DisplayPort. This way, it verifies the hpd_status variable
> >>>> before sending the status to the connector.
> >>>>
> >>>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> >>>> ---
> >>>>  drivers/gpu/drm/bridge/analogix/anx7625.c | 10 ++++------
> >>>>  1 file changed, 4 insertions(+), 6 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> >>>> index 764da1c1dc11..ad99ad19653f 100644
> >>>> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> >>>> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> >>>> @@ -1814,9 +1814,6 @@ static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
> >>>>
> >>>>      DRM_DEV_DEBUG_DRIVER(dev, "sink detect\n");
> >>>>
> >>>> -    if (ctx->pdata.panel_bridge)
> >>>> -            return connector_status_connected;
> >>>> -
> >>>>      return ctx->hpd_status ? connector_status_connected :
> >>>>                                   connector_status_disconnected;
> >>>>  }
> >>>> @@ -2608,9 +2605,10 @@ static int anx7625_link_bridge(struct drm_dp_aux *aux)
> >>>>      platform->bridge.of_node = dev->of_node;
> >>>>      if (!anx7625_of_panel_on_aux_bus(dev))
> >>>>              platform->bridge.ops |= DRM_BRIDGE_OP_EDID;
> >>>> -    if (!platform->pdata.panel_bridge)
> >>>> -            platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
> >>>> -                                    DRM_BRIDGE_OP_DETECT;
> >>>> +    if (!platform->pdata.panel_bridge ||
> >>>> +        platform->pdata.panel_bridge->type != DRM_MODE_CONNECTOR_eDP) {
> >>>> +            platform->bridge.ops |= DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_DETECT;
> >>>> +    }
> >>
> >> Hi Dmitry,
> >>
> >> Thanks, for the review.
> >>
> >> Yes, it is better to check the presence of the 'aux' node for eDP or DP configuration.
> >> Will change it in next patch.
> >>
> >> -       if (!platform->pdata.panel_bridge)
> >> -               platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
> >> -                                       DRM_BRIDGE_OP_DETECT;
> >> +       if (!platform->pdata.panel_bridge || !anx7625_of_panel_on_aux_bus(dev)) {
> > 
> > This is incorrect, if I'm not mistaken, please doublecheck it. I'd
> > suggest following msm_dp_display_get_connector_type() (feel free to
> > extract that to a helper function).
> > 
> 
> Hi Dmirty,
> 
> Thanks, for the review.
> 
> If we see definition of anx7625_of_panel_on_aux_bus() it is doing the same
> thing as msm_dp_display_get_connector_type().

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Please excuse my confusion.

> 
> static bool anx7625_of_panel_on_aux_bus(struct device *dev)
> {
>         struct device_node *bus, *panel;
> 
>         bus = of_get_child_by_name(dev->of_node, "aux-bus");
> 
>         // if aux-bus is not there it will return the false.
>         if (!bus)
>                 return false;
> 
>         panel = of_get_child_by_name(bus, "panel");
>         of_node_put(bus);
> 
>         // if panel is not there it will return the false.
>         if (!panel)
>                 return false;
>         of_node_put(panel);
> 
>         return true;
> }
> 
> Above function will return true in case of eDP and false in case of DP.
> So we can use anx7625_of_panel_on_aux_bus() to check whether it
> is DP or eDP configuration based on aux.
> 
> I don't think so we need extract msm_dp_display_get_connector_type() to check the eDP or DP configuration based on aux.
> Let me know, if I am missing anything.
> 
> Thanks,
> Ayushi
> 

-- 
With best wishes
Dmitry
